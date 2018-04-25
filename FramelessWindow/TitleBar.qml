import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4 as Controls_1_4

Rectangle{
    property string icon;
    property string title:qsTr("窗口");
    property QtObject parentObj;
    property color titleColor: "#BC2F2E";
    property color minBtnClickColor: "#F1707A";//点击时颜色
    property color minBtnHoveredColor: "#E81023";//hover颜色
    property color minBtnNormalColor: "#BC2F2E";//正常状态颜色
    property color maxBtnClickColor: "#F1707A";
    property color maxBtnHoveredColor: "#E81023";
    property color maxBtnNormalColor: "#BC2F2E";
    property color closeBtnClickColor: "#F1707A";
    property color closeBtnHoveredColor: "#E81023";
    property color closeBtnNormalColor: "#BC2F2E";
//    property real dpScale: 1.5;     //在不同的分辨率屏幕下的窗口伸缩因子
//    readonly property real dp: Math.max(Screen.pixelDensity*25.4/160*dpScale);

    id:titleBar;
    color: titleColor;
    z:100
    MouseArea{
        property real xmouse;   //鼠标的x轴坐标
        property real ymouse;   //y轴坐标
        anchors.fill: parent
        //cursorShape: Qt.SizeAllCursor;

        onPressed: {
                    xmouse=mouse.x;
                    ymouse=mouse.y;
                }

        onPositionChanged: {
            parentObj.x=parentObj.x+(mouse.x-xmouse);
            parentObj.y=parentObj.y+(mouse.y-ymouse);
        }
        onDoubleClicked: {
            maxBtn.onClicked();
        }
    }

    //图标
    Image {
        id: titleIcon
        source: icon;
        width: parent.height-15*dp
        height: parent.height-15*dp
        anchors{
            left: parent.left;
            leftMargin: 5*dp;
            verticalCenter: parent.verticalCenter;
        }
    }

    //标题
    Label{
        id:titleLabel
        anchors{
            left: titleIcon.right;
            leftMargin: 5*dp;
            verticalCenter: parent.verticalCenter;
        }
        text: title;
        color: "#ffffff"
        font{
            family: "Microsoft YaHei";
            pixelSize: 20;
            bold: false;
        }
    }

    //搜索
    Rectangle{
        id:searchTextEdit
        anchors{
            left:titleLabel.right
            leftMargin: 20*dp
            top:parent.top
            topMargin: 12*dp
            bottom: parent.bottom
            bottomMargin: 12*dp
        }
        color: "#a82828"
        radius: 20
        width: 300

        Controls_1_4.TextField{
            id:textEdit
            anchors.fill: parent
            anchors.leftMargin: 7*dp
            anchors.rightMargin: 10*dp
            //text: "123123123"
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 14
            textColor: "#C77373"
            placeholderText: qsTr("搜索音乐，歌手，歌词，用户");

            style: TextFieldStyle{
                placeholderTextColor: "#C77373";
                background: Rectangle{
                    color: "#a82828";
                }
            }

            Keys.enabled: true;
            Keys.onReturnPressed: {
                searchBtn.btnClicked();
            }

            onActiveFocusChanged: {
                if(activeFocus || searchDlg.activeFocus)
                {
                    if(text.length===0){
                        searchDlg.open();
                        icon_SearchRect.visible = true;
                        console.log("open")
                    }
                }
                else{
                    searchDlg.close();
                    icon_SearchRect.visible = false;
                    console.log("close")
                }
            }

//            onTextChanged: {
//                    if(text.length>0){
//                        searchDlg.close();
//                        console.log("close")
//                    }
//                    else{
//                        searchDlg.open();
//                        console.log("open")
//                    }
//            }

            Label{
                id:icon_SearchRect
                visible: false
                anchors{
                    top:parent.bottom
                    left: parent.left
                    leftMargin: 12*dp
                }
                height: 12*dp
                width: height
                color: "#ffffff"
                text: "\uf0d8";
                font.family: icomoonFont.name
                font.pixelSize: 16*dp;
            }
        }


        Label{
            font.family: icomoonFont.name
            font.pixelSize: 18;
            verticalAlignment:Label.AlignVCenter;
            horizontalAlignment: Label.AlignHCenter;
            color: "#C77373"
            text:"\uf002"
            anchors.right: searchTextEdit.right
            anchors.left: textEdit.right
            anchors.rightMargin: 15*dp
            anchors.bottom: searchTextEdit.bottom
            anchors.top: searchTextEdit.top

        }

        Popup{
            topMargin: titleBar.height+1*dp;
            id:searchDlg;
            //visible: false;
            width: searchTextEdit.width*1.5;
            height: 300*dp
            background: Loader{
                source: "qrc:/FramelessWindow/SearchRect.qml";
            }
            onClosed: textEdit.focus=false;
        }


        Component.onCompleted:{
            searchDlg.close();}

    }
    //最小化
    Button{
        id:minBtn;
        anchors{
            right: maxBtn.left;
        }
        flat: true;
        font{
            family: icomoonFont.name;
            pixelSize: 20;
        }
        text: "\uf2d1";
        anchors.verticalCenter: parent.verticalCenter
        background: Rectangle{
            implicitWidth: titleBar.height>20*dp?20*dp:titleBar.height;
            implicitHeight: implicitWidth;
            color: {
                if(minBtn.pressed && minBtn.hovered)
                    return minBtnClickColor;
                if(minBtn.hovered)
                    return minBtnHoveredColor;
                else
                    return minBtnNormalColor;
            }
        }
        contentItem: Label{
            text: minBtn.text;
            font: minBtn.font;
            color: "#ffffff";
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        ToolTip.visible: minBtn.hovered;
        ToolTip.delay: 500;
        ToolTip.text: qsTr("最小化");

        onClicked: {
            parentObj.visibility=Window.Minimized;
        }
    }
    //最大化
    Button{
        id:maxBtn;
        anchors{
            right: closeBtn.left;
        }
        flat: true;
        font{
            family: icomoonFont.name;
            pixelSize: 20;
        }
        text: {
            if(parentObj.visibility!==Window.FullScreen)
                return "\uf2d0";
            else
                return "\uf2d2";
        }
        anchors.verticalCenter: parent.verticalCenter

        background: Rectangle{
            implicitWidth: titleBar.height>20*dp?20*dp:titleBar.height;
            implicitHeight: implicitWidth;
            color: {
                if(maxBtn.pressed && maxBtn.hovered)
                    return maxBtnClickColor;
                if(maxBtn.hovered)
                    return maxBtnHoveredColor;
                else
                    return maxBtnNormalColor;
            }
        }
        contentItem: Label{
            text: maxBtn.text;
            font: maxBtn.font;
            color: "#ffffff";
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        ToolTip.visible: maxBtn.hovered;
        ToolTip.delay: 500;
        ToolTip.text: parentObj.visibility===Window.FullScreen?qsTr("向下还原"):qsTr("最大化");

        onClicked: {
            parentObj.visibility=parentObj.visibility===Window.FullScreen?Window.Windowed:Window.FullScreen;
        }
    }
    //关闭
    Button{
        id:closeBtn;
        anchors{
            right: parent.right;
        }
        flat: true;
        font{
            family: icomoonFont.name;
            pixelSize: 20;
        }
        text: "\uf410";
        anchors.verticalCenter: parent.verticalCenter
        background: Rectangle{
            implicitWidth: titleBar.height>20*dp?20*dp:titleBar.height;
            implicitHeight: implicitWidth;
            color: {
                if(closeBtn.pressed && closeBtn.hovered)
                    return closeBtnClickColor;
                if(closeBtn.hovered)
                    return closeBtnHoveredColor;
                else
                    return closeBtnNormalColor;
            }
        }

        contentItem: Label{
            text: closeBtn.text;
            font: closeBtn.font;
            color: "#ffffff";
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        ToolTip.visible: closeBtn.hovered;
        ToolTip.delay: 500;
        ToolTip.text: qsTr("关闭");

        onClicked: {
            Qt.quit();
        }
    }

}
