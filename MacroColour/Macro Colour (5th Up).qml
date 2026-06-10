import QtQuick 2.9
import MuseScore 3.0

MuseScore {
    menuPath: "Plugins.MacroColour 5th Up"
    description: "Colours noteheads by macrotonal category — 5th Up mode"
    version: "1.1"

    function noteColour(pitch) {
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
        if (pitch === 117) return "#E8412A"
        if (pitch === 118) return "#F5C500"
        if (pitch === 120) return "#2EAA4A"
        if (pitch === 121) return "#2B7FD4"
        if (pitch === 122) return "#E8412A"
        if (pitch === 123) return "#F5C500"
        if (pitch === 125) return "#2EAA4A"
        if (pitch === 126) return "#2B7FD4"
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
