import QtQuick 2.9
import MuseScore 3.0

MuseScore {
    menuPath: "Plugins.MacroColour"
    description: "Colours noteheads by macrotonal category. Operates on selection if one exists, otherwise all staves."
    version: "1.4"

    function noteColour(pitch) {
        if (pitch === 15) return "#E8412A"
        if (pitch === 16) return "#F5C500"
        if (pitch === 18) return "#2EAA4A"
        if (pitch === 19) return "#2B7FD4"
        if (pitch === 20) return "#E8412A"
        if (pitch === 21) return "#F5C500"
        if (pitch === 23) return "#2EAA4A"
        if (pitch === 24) return "#2B7FD4"
        if (pitch === 25) return "#E8412A"
        if (pitch === 26) return "#F5C500"
        if (pitch === 28) return "#2EAA4A"
        if (pitch === 29) return "#2B7FD4"
        if (pitch === 30) return "#E8412A"
        if (pitch === 31) return "#F5C500"
        if (pitch === 33) return "#2EAA4A"
        if (pitch === 34) return "#2B7FD4"
        if (pitch === 35) return "#E8412A"
        if (pitch === 36) return "#F5C500"
        if (pitch === 38) return "#2EAA4A"
        if (pitch === 39) return "#2B7FD4"
        if (pitch === 40) return "#E8412A"
        if (pitch === 41) return "#F5C500"
        if (pitch === 43) return "#2EAA4A"
        if (pitch === 44) return "#2B7FD4"
        if (pitch === 45) return "#E8412A"
        if (pitch === 46) return "#F5C500"
        if (pitch === 48) return "#2EAA4A"
        if (pitch === 49) return "#2B7FD4"
        if (pitch === 50) return "#E8412A"
        if (pitch === 51) return "#F5C500"
        if (pitch === 53) return "#2EAA4A"
        if (pitch === 54) return "#2B7FD4"
        if (pitch === 55) return "#E8412A"
        if (pitch === 56) return "#F5C500"
        if (pitch === 58) return "#2EAA4A"
        if (pitch === 59) return "#2B7FD4"
        if (pitch === 60) return "#E8412A"
        if (pitch === 61) return "#F5C500"
        if (pitch === 63) return "#2EAA4A"
        if (pitch === 64) return "#2B7FD4"
        if (pitch === 65) return "#E8412A"
        if (pitch === 66) return "#F5C500"
        if (pitch === 68) return "#2EAA4A"
        if (pitch === 69) return "#2B7FD4"
        if (pitch === 70) return "#E8412A"
        if (pitch === 71) return "#F5C500"
        if (pitch === 73) return "#2EAA4A"
        if (pitch === 74) return "#2B7FD4"
        if (pitch === 75) return "#E8412A"
        if (pitch === 76) return "#F5C500"
        if (pitch === 78) return "#2EAA4A"
        if (pitch === 79) return "#2B7FD4"
        if (pitch === 80) return "#E8412A"
        if (pitch === 81) return "#F5C500"
        if (pitch === 83) return "#2EAA4A"
        if (pitch === 84) return "#2B7FD4"
        if (pitch === 85) return "#E8412A"
        if (pitch === 86) return "#F5C500"
        if (pitch === 88) return "#2EAA4A"
        if (pitch === 89) return "#2B7FD4"
        if (pitch === 90) return "#E8412A"
        if (pitch === 91) return "#F5C500"
        if (pitch === 93) return "#2EAA4A"
        if (pitch === 94) return "#2B7FD4"
        if (pitch === 95) return "#E8412A"
        if (pitch === 96) return "#F5C500"
        if (pitch === 98) return "#2EAA4A"
        if (pitch === 99) return "#2B7FD4"
        if (pitch === 100) return "#E8412A"
        if (pitch === 101) return "#F5C500"
        if (pitch === 103) return "#2EAA4A"
        if (pitch === 104) return "#2B7FD4"
        if (pitch === 105) return "#E8412A"
        if (pitch === 106) return "#F5C500"
        if (pitch === 108) return "#2EAA4A"
        if (pitch === 109) return "#2B7FD4"
        if (pitch === 110) return "#E8412A"
        if (pitch === 111) return "#F5C500"
        if (pitch === 113) return "#2EAA4A"
        if (pitch === 114) return "#2B7FD4"
        if (pitch === 115) return "#E8412A"
        if (pitch === 116) return "#F5C500"
        if (pitch === 118) return "#2EAA4A"
        if (pitch === 119) return "#2B7FD4"
        return "#000000"
    }

    onRun: {
        if (!curScore) return

        var voices     = [0, 1, 2, 3]
        var isRange    = curScore.selection.isRange
        var startStaff = 0
        var endStaff   = curScore.nstaves - 1
        var endTick    = curScore.lastSegment.tick + 1

        if (isRange) {
            var rangeCursor = curScore.newCursor()
            rangeCursor.rewind(1)
            startStaff = rangeCursor.staffIdx
            rangeCursor.rewind(2)
            endStaff   = rangeCursor.staffIdx
            endTick    = (rangeCursor.tick === 0)
                         ? curScore.lastSegment.tick + 1
                         : rangeCursor.tick
        }

        curScore.startCmd()

        for (var staffIdx = startStaff; staffIdx <= endStaff; staffIdx++) {
            for (var v = 0; v < voices.length; v++) {

                // Fresh cursor every iteration — same pattern as original plugin
                var cursor = curScore.newCursor()
                cursor.rewind(isRange ? 1 : 0)
                cursor.staffIdx = staffIdx
                cursor.voice    = v

                while (cursor.segment && cursor.tick < endTick) {
                    if (cursor.element && cursor.element.type === Element.CHORD) {
                        var chord = cursor.element
                        var notes = chord.notes
                        for (var i = 0; i < notes.length; i++) {
                            notes[i].color = noteColour(notes[i].pitch)
                        }
                        if (notes.length > 0 && chord.stem) {
                            chord.stem.color = noteColour(notes[0].pitch)
                        }
                    }
                    cursor.next()
                }
            }
        }

        curScore.endCmd()
    }
}
