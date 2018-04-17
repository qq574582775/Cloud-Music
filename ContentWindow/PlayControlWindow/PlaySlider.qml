import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3




Rectangle{
    Slider {
        id: sliderControl;
        anchors.left: parent.left
        width: parent.width
        anchors.top:parent.top
        anchors.topMargin: parent.height/9*2
        anchors.bottom: parent.bottom

        background: Rectangle {
            x: sliderControl.leftPadding
            y: sliderControl.topPadding + sliderControl.availableHeight / 2 - height / 2
            implicitWidth: sliderControl.width;
            implicitHeight: 3*dp;
            width: sliderControl.availableWidth
            height: implicitHeight
            radius: 3*dp;
            color: "#999999"

            Rectangle {
                width: sliderControl.visualPosition * parent.width
                height: parent.height
                color: "#b82525"
                radius: 3*dp;
            }
        }


        handle: Rectangle {
            x: sliderControl.leftPadding + sliderControl.visualPosition * (sliderControl.availableWidth - width)
            y: sliderControl.topPadding + sliderControl.availableHeight / 2 - height / 2
            width: 10*dp;
            height: 10*dp;
            radius: 10*dp;
            color: "#f6f6f6"

            Label{
                id:cd;
                anchors.verticalCenter: parent.verticalCenter;
                anchors.horizontalCenter: parent.horizontalCenter;
                text: "\uf192";
                color: "#b82525";
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter;
                font.family:regularIcomoonFont.name;
                font.pixelSize: 13*dp;
            }


//            MouseArea{
//                property real xmouse;
//                anchors.fill: parent;
//                hoverEnabled: true;

//                cursorShape: Qt.PointingHandCursor;
//                acceptedButtons: Qt.LeftButton;
//                onPressed: {
//                    xmouse=mouseX;
//                    sliderControl.ispressed=true;
//                }

//                onReleased: {
//                    sliderControl.ispressed=false;
//                    //sliderControl.releasedFunc();
//                }

//                onPositionChanged: {
//                    if(pressed)
//                    {
//                        sliderControl.value=sliderControl.value+(mouseX-xmouse)/(sliderControl.width)*(maxValue-minValue);
//                    }
//                }
//            }
        }
    }

    Label{
        id:songInfo
        text: "if you - bigbang"
        anchors{
            left: sliderControl.left
            leftMargin: 3*dp
            right: songTimeInfo.left
            rightMargin: 8*dp
            top:parent.top
            topMargin: 7*dp
            bottom: sliderControl.verticalCenter
        }

        font{
            family: "Microsoft YaHei";
            pixelSize: 14;
            bold: false;
        }
        color: "#777777"
    }

    Label{
        id:songTimeInfo
        text: "01:12 : 03:30"
        width: 60*dp
        anchors{
            right : sliderControl.right
            rightMargin: 5*dp
            verticalCenter: songInfo.verticalCenter
        }

        font{
            family: "Microsoft YaHei";
            pixelSize: 10;
            bold: false;
        }
        color: "#777777"
        horizontalAlignment: Text.AlignRight
    }


}
