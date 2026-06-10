import QtQuick 2.9
import MuseScore 3.0

MuseScore {
    menuPath: "Plugins.MacroColour 1 Octave Down"
    description: "Colours noteheads by macrotonal category — 1 Octave Down mode"
    version: "1.1"

    function noteColour(pitch) {
        if (pitch === 3) return "#E8412A"
        if (pitch === 4) return "#F5C500"
        if (pitch === 6) return "#2EAA4A"
        if (pitch === 7) return "#2B7FD4"
        if (pitch === 8) return "#E8412A"
        if (pitch === 9) return "#F5C500"
        if (pitch === 11) return "#2EAA4A"
        if (pitch === 12) return "#2B7FD4"
        if (pitch === 13) return "#E8412A"
        if (pitch === 14) return "#F5C500"
        if (pitch === 16) return "#2EAA4A"
        if (pitch === 17) return "#2B7FD4"
        if (pitch === 18) return "#E8412A"
        if (pitch === 19) return "#F5C500"
        if (pitch === 21) return "#2EAA4A"
        if (pitch === 22) return "#2B7FD4"
        if (pitch === 23) return "#E8412A"
        if (pitch === 24) return "#F5C500"
        if (pitch === 26) return "#2EAA4A"
        if (pitch === 27) return "#2B7FD4"
        if (pitch === 28) return "#E8412A"
        if (pitch === 29) return "#F5C500"
        if (pitch === 31) return "#2EAA4A"
        if (pitch === 32) return "#2B7FD4"
        if (pitch === 33) return "#E8412A"
        if (pitch === 34) return "#F5C500"
        if (pitch === 36) return "#2EAA4A"
        if (pitch === 37) return "#2B7FD4"
        if (pitch === 38) return "#E8412A"
        if (pitch === 39) return "#F5C500"
        if (pitch === 41) return "#2EAA4A"
        if (pitch === 42) return "#2B7FD4"
        if (pitch === 43) return "#E8412A"
        if (pitch === 44) return "#F5C500"
        if (pitch === 46) return "#2EAA4A"
        if (pitch === 47) return "#2B7FD4"
        if (pitch === 48) return "#E8412A"
        if (pitch === 49) return "#F5C500"
        if (pitch === 51) return "#2EAA4A"
        if (pitch === 52) return "#2B7FD4"
        if (pitch === 53) return "#E8412A"
        if (pitch === 54) return "#F5C500"
        if (pitch === 56) return "#2EAA4A"
        if (pitch === 57) return "#2B7FD4"
        if (pitch === 58) return "#E8412A"
        if (pitch === 59) return "#F5C500"
        if (pitch === 61) return "#2EAA4A"
        if (pitch === 62) return "#2B7FD4"
        if (pitch === 63) return "#E8412A"
        if (pitch === 64) return "#F5C500"
        if (pitch === 66) return "#2EAA4A"
        if (pitch === 67) return "#2B7FD4"
        if (pitch === 68) return "#E8412A"
        if (pitch === 69) return "#F5C500"
        if (pitch === 71) return "#2EAA4A"
        if (pitch === 72) return "#2B7FD4"
        if (pitch === 73) return "#E8412A"
        if (pitch === 74) return "#F5C500"
        if (pitch === 76) return "#2EAA4A"
        if (pitch === 77) return "#2B7FD4"
        if (pitch === 78) return "#E8412A"
        if (pitch === 79) return "#F5C500"
        if (pitch === 81) return "#2EAA4A"
        if (pitch === 82) return "#2B7FD4"
        if (pitch === 83) return "#E8412A"
        if (pitch === 84) return "#F5C500"
        if (pitch === 86) return "#2EAA4A"
        if (pitch === 87) return "#2B7FD4"
        if (pitch === 88) return "#E8412A"
        if (pitch === 89) return "#F5C500"
        if (pitch === 91) return "#2EAA4A"
        if (pitch === 92) return "#2B7FD4"
        if (pitch === 93) return "#E8412A"
        if (pitch === 94) return "#F5C500"
        if (pitch === 96) return "#2EAA4A"
        if (pitch === 97) return "#2B7FD4"
        if (pitch === 98) return "#E8412A"
        if (pitch === 99) return "#F5C500"
        if (pitch === 101) return "#2EAA4A"
        if (pitch === 102) return "#2B7FD4"
        if (pitch === 103) return "#E8412A"
        if (pitch === 104) return "#F5C500"
        if (pitch === 106) return "#2EAA4A"
        if (pitch === 107) return "#2B7FD4"
        return "#000000"
    }

    onRun: {
        if (!curScore) return

        curScore.startCmd()

        var cursor = curScore.newCursor()
        cursor.rewind(0)
        cursor.staffIdx = 0
        cursor.voice = 0

        while (cursor.segment) {
            if (cursor.element) {
                if (cursor.element.type === Element.CHORD) {
                    var notes = cursor.element.notes
                    for (var i = 0; i < notes.length; i++) {
                        notes[i].color = noteColour(notes[i].pitch)
                    }
                }
            }
            cursor.next()
        }

        curScore.endCmd()
    }
}
