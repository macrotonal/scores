import QtQuick 2.9
import MuseScore 3.0

MuseScore {
    menuPath: "Plugins.MacroColour 2 Octaves Down"
    description: "Colours noteheads by macrotonal category — 2 Octaves Down mode"
    version: "1.1"

    function noteColour(pitch) {
        if (pitch === 0) return "#2B7FD4"
        if (pitch === 1) return "#E8412A"
        if (pitch === 2) return "#F5C500"
        if (pitch === 4) return "#2EAA4A"
        if (pitch === 5) return "#2B7FD4"
        if (pitch === 6) return "#E8412A"
        if (pitch === 7) return "#F5C500"
        if (pitch === 9) return "#2EAA4A"
        if (pitch === 10) return "#2B7FD4"
        if (pitch === 11) return "#E8412A"
        if (pitch === 12) return "#F5C500"
        if (pitch === 14) return "#2EAA4A"
        if (pitch === 15) return "#2B7FD4"
        if (pitch === 16) return "#E8412A"
        if (pitch === 17) return "#F5C500"
        if (pitch === 19) return "#2EAA4A"
        if (pitch === 20) return "#2B7FD4"
        if (pitch === 21) return "#E8412A"
        if (pitch === 22) return "#F5C500"
        if (pitch === 24) return "#2EAA4A"
        if (pitch === 25) return "#2B7FD4"
        if (pitch === 26) return "#E8412A"
        if (pitch === 27) return "#F5C500"
        if (pitch === 29) return "#2EAA4A"
        if (pitch === 30) return "#2B7FD4"
        if (pitch === 31) return "#E8412A"
        if (pitch === 32) return "#F5C500"
        if (pitch === 34) return "#2EAA4A"
        if (pitch === 35) return "#2B7FD4"
        if (pitch === 36) return "#E8412A"
        if (pitch === 37) return "#F5C500"
        if (pitch === 39) return "#2EAA4A"
        if (pitch === 40) return "#2B7FD4"
        if (pitch === 41) return "#E8412A"
        if (pitch === 42) return "#F5C500"
        if (pitch === 44) return "#2EAA4A"
        if (pitch === 45) return "#2B7FD4"
        if (pitch === 46) return "#E8412A"
        if (pitch === 47) return "#F5C500"
        if (pitch === 49) return "#2EAA4A"
        if (pitch === 50) return "#2B7FD4"
        if (pitch === 51) return "#E8412A"
        if (pitch === 52) return "#F5C500"
        if (pitch === 54) return "#2EAA4A"
        if (pitch === 55) return "#2B7FD4"
        if (pitch === 56) return "#E8412A"
        if (pitch === 57) return "#F5C500"
        if (pitch === 59) return "#2EAA4A"
        if (pitch === 60) return "#2B7FD4"
        if (pitch === 61) return "#E8412A"
        if (pitch === 62) return "#F5C500"
        if (pitch === 64) return "#2EAA4A"
        if (pitch === 65) return "#2B7FD4"
        if (pitch === 66) return "#E8412A"
        if (pitch === 67) return "#F5C500"
        if (pitch === 69) return "#2EAA4A"
        if (pitch === 70) return "#2B7FD4"
        if (pitch === 71) return "#E8412A"
        if (pitch === 72) return "#F5C500"
        if (pitch === 74) return "#2EAA4A"
        if (pitch === 75) return "#2B7FD4"
        if (pitch === 76) return "#E8412A"
        if (pitch === 77) return "#F5C500"
        if (pitch === 79) return "#2EAA4A"
        if (pitch === 80) return "#2B7FD4"
        if (pitch === 81) return "#E8412A"
        if (pitch === 82) return "#F5C500"
        if (pitch === 84) return "#2EAA4A"
        if (pitch === 85) return "#2B7FD4"
        if (pitch === 86) return "#E8412A"
        if (pitch === 87) return "#F5C500"
        if (pitch === 89) return "#2EAA4A"
        if (pitch === 90) return "#2B7FD4"
        if (pitch === 91) return "#E8412A"
        if (pitch === 92) return "#F5C500"
        if (pitch === 94) return "#2EAA4A"
        if (pitch === 95) return "#2B7FD4"
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
