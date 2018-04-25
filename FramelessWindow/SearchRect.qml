import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Rectangle {
    id: rectangle1
    property color backgroug: "#fafafa"
    color: "#ffffff"
    radius: 5
    border.color: "#f0f0f0"
    border.width: 3
    anchors.fill: parent

    Rectangle {
        id: rectangle
        height: 33
        color: "#ffffff"
        z: 1
        border.width: 1
        border.color: "#f0f0f0"
        anchors.right: parent.horizontalCenter
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 2
        anchors.top: parent.top
        anchors.topMargin: 2

        Label {
            id: hotSearch
            width: height
            color: "#e1e1e1"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.left: parent.left
            anchors.leftMargin: 1
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 1
            font{
                family: icomoonFont.name;
                pixelSize: 12*dp;
            }
            text: "\uf002"

        }
        Label {
            id: hotSearch1
            color: "#c1c1c1"
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: hotSearch.right
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 1
            verticalAlignment: Text.AlignVCenter
            font{
                family: "Microsoft YaHei";
                pixelSize: 12*dp;
            }
            text: qsTr("热门搜索")
        }
    }

    Rectangle {
        id: rectangle2
        color: "#ffffff"
        z: 1
        border.color: "#f0f0f0"
        anchors.bottom: rectangle.bottom
        anchors.bottomMargin: 0
        anchors.left: parent.horizontalCenter
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 3
        anchors.top: parent.top
        anchors.topMargin: 2

        Label {
            id: historySearch
            width: height
            color: "#e1e1e1"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 1
            font{
                family: regularIcomoonFont.name;
                pixelSize: 12*dp;
            }
            text: "\uf017"

        }

        Label {
            id: historySearch1
            color: "#c1c1c1"
            anchors.left: historySearch.right
            anchors.leftMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 2
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 1
            verticalAlignment: Text.AlignVCenter
            font{
                family: "Microsoft YaHei";
                pixelSize: 12*dp;
            }
            text: qsTr("搜索历史")

        }
    }

    Rectangle {
        id:listView
        color: "#ffffff"
        border.color: "#f0f0f0"
        anchors.right: parent.horizontalCenter
        anchors.rightMargin: 0
        anchors.top: rectangle.bottom
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 1
        anchors.left: parent.left
        anchors.leftMargin: 1
        ListView{
            id:hotSearchTextView
            anchors.fill: parent
            model:hotSearchTextList
            delegate:hotSearchTextViewDelegate
        }
        ListModel{
            id:hotSearchTextList
            ListElement { text_: qsTr("李志") }
            ListElement { text_: qsTr("没有理由") }
            ListElement { text_: qsTr("林宥嘉") }
            ListElement { text_: qsTr("侧田") }
            ListElement { text_: qsTr("周杰伦") }
        }
        Component{
            id:hotSearchTextViewDelegate
            Button{
                height: 30*dp
                width: parent.width
                background: Rectangle{
                    color: hovered ? "#f0f0f0":"#ffffff"
                }
                Label{
                    anchors.fill: parent
                    anchors.leftMargin: 20*dp
                    text: text_
                    font.family: "Microsoft YaHei";
                    font.pixelSize: 12*dp
                    verticalAlignment: Label.AlignVCenter
                }
            }
        }
    }

    Rectangle {
        border.color: "#f0f0f0"
        anchors.left: listView.right
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 1
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 1
        anchors.top: rectangle2.bottom
        anchors.topMargin: 0
    }



}
