import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Rectangle {
    id: rectangle1
    property color backgroug: "#fafafa"
    color: backgroug
    radius: 5
    border.color: "#000000"
    border.width: 2
    anchors.fill: parent

    Rectangle {
        id: rectangle
        height: 33
        color: backgroug
        border.width: 0
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
            color: "#ffffff"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.left: parent.left
            anchors.leftMargin: 1
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 1

        }
        Label {
            id: hotSearch1
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: hotSearch.right
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 1

        }
    }

    Rectangle {
        id: rectangle2
        color: backgroug
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
            color: "#ffffff"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 1

        }

        Label {
            id: historySearch1
            anchors.left: historySearch.right
            anchors.leftMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 2
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 1

        }
    }

    ListView {
        id: scrollView
        anchors.right: parent.horizontalCenter
        anchors.rightMargin: 0
        anchors.top: rectangle.bottom
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 1
        anchors.left: parent.left
        anchors.leftMargin: 1
    }

    ListView {
        id: scrollView1
        anchors.left: scrollView.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 1
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 1
        anchors.top: rectangle2.bottom
        anchors.topMargin: 0
    }



}
