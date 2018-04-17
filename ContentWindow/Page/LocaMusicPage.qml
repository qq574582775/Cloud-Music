import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Page {
    property int interval : 20*dp

    Rectangle{
        id: rectangle1
        anchors.fill: parent
        color: "#fefefe"
        border.color: "#fefefe"
        border.width: 0

        Label {
            id: title
            y: 27
            width: 79
            height: 30
            text: qsTr("本地音乐")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignBottom
            anchors.left: parent.left
            anchors.leftMargin: 20
            font.family: "Arial"
        }

        Label {
            id: musicNum
            y: 37
            width: 47
            height: 20
            text: qsTr("0首音乐")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignBottom
            anchors.bottom: title.bottom
            anchors.bottomMargin: 0
            anchors.left: title.right
            anchors.leftMargin: 10
        }

        Button {
            id: chooseDir
            y: 37
            width: 66
            height: 20
            text: qsTr("选择目录")
            anchors.bottom: title.bottom
            anchors.bottomMargin: 0
            anchors.left: musicNum.right
            anchors.leftMargin: 10
        }

        Button {
            id: listBtn
            x: 500
            y: 37
            width: 23
            height: 20
            text: qsTr("1")
            anchors.bottom: title.bottom
            anchors.bottomMargin: 0
            anchors.right: singerBtn.left
            anchors.rightMargin: 0
        }

        Button {
            id: singerBtn
            x: 509
            y: 37
            width: 23
            height: 20
            text: qsTr("2")
            anchors.bottom: title.bottom
            anchors.bottomMargin: 0
            anchors.right: specialBtn.left
            anchors.rightMargin: 0
        }

        Button {
            id: specialBtn
            x: 534
            y: 37
            width: 23
            height: 20
            text: qsTr("3")
            anchors.bottom: title.bottom
            anchors.bottomMargin: 0
            anchors.right: folder.left
            anchors.rightMargin: 0
        }

        Button {
            id: folder
            x: 558
            y: 37
            width: 23
            height: 20
            text: qsTr("4")
            anchors.bottom: title.bottom
            anchors.bottomMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 20
        }

        Rectangle {
            id: interval
            y: 73
            height: 6
            border.width: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            color: "#f0f0f0"
        }

        Rectangle {
            id: rectangle2
            color: "#ffffff"
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: interval.bottom
            anchors.topMargin: 0




            Button {
                id: button
                x: 232
                y: 181
                width: 177
                height: 40
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("选择本地文件夹")
//                    background: Rectangle{
//                        id:backgroundRect;
//                        color: currentItem ? clickedColor:(hovered?hoveredColor:normalColor)
//                    }
            }


            Label {
                id: label
                x: 231
                y: 66
                width: 177
                height: 32
                text: qsTr("请选择本地音乐")
                anchors.horizontalCenter: parent.horizontalCenter
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

            }

            Label {
                id: label1
                x: 136
                y: 117
                width: 369
                height: 32
                text: qsTr("升级本地音乐为高品质并和朋友分享")
                anchors.horizontalCenter: parent.horizontalCenter
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }
}
