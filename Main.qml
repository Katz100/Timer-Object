import QtQuick
import com.company.mytimer
import QtQuick.Controls
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Text {
        id: timerText
        text: MyTimer.seconds
        anchors.centerIn: parent
    }

    Button {
        id: startButton
        anchors.top: timerText.bottom
        text: "Start"

        onClicked: {
            MyTimer.setTimer(parseInt(txtField.text))
        }
    }
    Button {
        id: pauseButton
        anchors.top: startButton.bottom
        anchors.topMargin: 20
        text: MyTimer.pause_timer ? "Resume" : "Pause"

        onClicked: {
            MyTimer.pauseStartTimer()
        }
    }
    Button {
        id: resetButton
        anchors.top: pauseButton.bottom
        anchors.topMargin: 20
        text: "Reset"

        onClicked: {
            MyTimer.resetTimer();
        }
    }

    TextField {
        id: txtField
        anchors.top: resetButton.bottom

    }

}
