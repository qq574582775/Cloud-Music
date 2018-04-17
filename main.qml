import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import qt.Player 1.0
import "FramelessWindow"

ApplicationWindow {
    property real dpScale: 1.5;     //在不同的分辨率屏幕下的窗口伸缩因子
    readonly property real dp: Math.max(Screen.pixelDensity*25.4/160*dpScale);

    property real minWidth: 500*dp;
    property real minHeight: 400*dp;
    id:mainwindow
    visible: true
    width: 800*dp
    height: 600*dp
    flags:Qt.FramelessWindowHint | Qt.Window;

    Player{
        id:music_player
    }

    FontLoader{
        id:icomoonFont;
        source: "qrc:/Font/Font Awesome 5 Free-Solid-900.otf";
    }
    FontLoader{
        id:regularIcomoonFont;
        source: "qrc:/Font/Font Awesome 5 Free-Regular-400.otf";
    }

    FramelessWindow{
        parentObj: mainwindow;
        titleIcon: "qrc:/images/logo.png"
        titleText: qsTr("网易云音乐")
    }


//    header: ToolBar {
//        // ...
//    }

//    footer: Rectangle {
//        height: 70
//        color: "#303030"

//        Rectangle{
//            id:music_autor_image
//            width: parent.height -2
//            height: parent.height -2
//            anchors.left: parent.left
//            anchors.leftMargin: 1
//            anchors.top: parent.top
//            anchors.topMargin: 1
//        }
//        RadioButtons{
//            id:previous_btn
//            width: parent.height -2
//            height: parent.height -2
//            anchors.left: music_autor_image.right
//            anchors.leftMargin: 1
//            anchors.top: parent.top
//            anchors.topMargin: 1
//            text: "|<"
//            onClicked: {
//                console.log("1111")
//            }
//        }
//        RadioButtons{
//            id:run_btn
//            width: parent.height -2
//            height: parent.height -2
//            anchors.left: previous_btn.right
//            anchors.leftMargin: 1
//            anchors.top: parent.top
//            anchors.topMargin: 1
//            text: "||"
//            onClicked: {
//                music_player.playSL("666");
//                //console.log("2")
//            }
//        }
//        RadioButtons{
//            id:next_btn
//            width: parent.height -2
//            height: parent.height -2
//            anchors.left: run_btn.right
//            anchors.leftMargin: 1
//            anchors.top: parent.top
//            anchors.topMargin: 1
//            text: ">|"
//            onClicked: {
//                console.log("3")
//            }
//        }
//    }

//    StackView {
//        anchors.fill: parent
//    }
}
