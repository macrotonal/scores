import QtQuick 2.9
import MuseScore 3.0

MuseScore {
    menuPath: "Plugins.MacroColour Minor 3rd Down"
    description: "Colours noteheads by macrotonal category — Minor 3rd Down mode. Operates on selection if one exists, otherwise all staves."
    version: "1.2"

    function noteColour(pitch) {
        if (pitch === 12) return "#E8412A"
        if (pitch === 13) return "#F5C500"
        if (pitch === 15) return "#2EAA4A"
        if (pitch === 16) return "#2B7FD4"
        if (pitch === 17) return "#E8412A"
        if (pitch === 18) return "#F5C500"
        if (pitch === 20) return "#2EAA4A"
        if (pitch === 21) return "#2B7FD4"
        if (pitch === 22) return "#E8412A"
        if (pitch === 23) return "#F5C500"
        if (pitch === 25) return "#2EAA4A"
        if (pitch === 26) return "#2B7FD4"
        if (pitch === 27) return "#E8412A"
        if (pitch === 28) return "#F5C500"
        if (pitch === 30) return "#2EAA4A"
        if (pitch === 31) return "#2B7FD4"
        if (pitch === 32) return "#E8412A"
        if (pitch === 33) return "#F5C500"
        if (pitch === 35) return "#2EAA4A"
        if (pitch === 36) return "#2B7FD4"
        if (pitch === 37) return "#E8412A"
        if (pitch === 38) return "#F5C500"
        if (pitch === 40) return "#2EAA4A"
        if (pitch === 41) return "#2B7FD4"
        if (pitch === 42) return "#E8412A"
        if (pitch === 43) return "#F5C500"
        if (pitch === 45) return "#2EAA4A"
        if (pitch === 46) return "#2B7FD4"
        if (pitch === 47) return "#E8412A"
        if (pitch === 48) return "#F5C500"
        if (pitch === 50) return "#2EAA4A"
        if (pitch === 51) return "#2B7FD4"
        if (pitch === 52) return "#E8412A"
        if (pitch === 53) return "#F5C500"
        if (pitch === 55) return "#2EAA4A"
        if (pitch === 56) return "#2B7FD4"
        if (pitch === 57) return "#E8412A"
        if (pitch === 58) return "#F5C500"
        if (pitch === 60) return "#2EAA4A"
        if (pitch === 61) return "#2B7FD4"
        if (pitch === 62) return "#E8412A"
        if (pitch === 63) return "#F5C500"
        if (pitch === 65) return "#2EAA4A"
        if (pitch === 66) return "#2B7FD4"
        if (pitch === 67) return "#E8412A"
        if (pitch === 68) return "#F5C500"
        if (pitch === 70) return "#2EAA4A"
        if (pitch === 71) return "#2B7FD4"
        if (pitch === 72) return "#E8412A"
        if (pitch === 73) return "#F5C500"
        if (pitch === 75) return "#2EAA4A"
        if (pitch === 76) return "#2B7FD4"
        if (pitch === 77) return "#E8412A"
        if (pitch === 78) return "#F5C500"
        if (pitch === 80) return "#2EAA4A"
        if (pitch === 81) return "#2B7FD4"
        if (pitch === 82) return "#E8412A"
        if (pitch === 83) return "#F5C500"
        if (pitch === 85) return "#2EAA4A"
        if (pitch === 86) return "#2B7FD4"
        if (pitch === 87) return "#E8412A"
        if (pitch === 88) return "#F5C500"
        if (pitch === 90) return "#2EAA4A"
        if (pitch === 91) return "#2B7FD4"
        if (pitch === 92) return "#E8412A"
        if (pitch === 93) return "#F5C500"
        if (pitch === 95) return "#2EAA4A"
        if (pitch === 96) return "#2B7FD4"
        if (pitch === 97) return "#E8412A"
        if (pitch === 98) return "#F5C500"
        if (pitch === 100) return "#2EAA4A"
        if (pitch === 101) return "#2B7FD4"
        if (pitch === 102) return "#E8412A"
        if (pitch === 103) return "#F5C500"
        if (pitch === 105) return "#2EAA4A"
        if (pitch === 106) return "#2B7FD4"
        if (pitch === 107) return "#E8412A"
        if (pitch === 108) return "#F5C500"
        if (pitch === 110) return "#2EAA4A"
        if (pitch === 111) return "#2B7FD4"
        if (pitch === 112) return "#E8412A"
        if (pitch === 113) return "#F5C500"
        if (pitch === 115) return "#2EAA4A"
        if (pitch === 116) return "#2B7FD4"
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
