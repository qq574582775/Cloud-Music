/*
  主要的界面代码
  */

import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import "NavigationBar"
import "PlayControlWindow"

Page{
    id:contentWindow
    //标题栏
    NavigationBar{
        id:navBar;
        width: 200*dp;
        anchors.left: parent.left;
        //anchors.leftMargin: 0.5*dp;
        anchors.top: parent.top;
        anchors.bottom: footer_.top;
    }
    Loader{
        id:mainPage
        anchors.left: navBar.right;
        anchors.top: parent.top;
        anchors.right: parent.right
        anchors.bottom: footer_.top;
        source: "qrc:/ContentWindow/Page/SearchPage.qml";
        }

    PlayControlWindow{
        id:footer_
        anchors.bottom: parent.bottom
    }
}
