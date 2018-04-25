import QtQuick 2.7
import QtQuick.Controls 2.2

BorderImage {
    id: root;
    anchors.fill: parent
    source: "qrc:/images/volumeBorder.png";
    Rectangle{
        id: rectangle1
        anchors{
            fill: parent
            leftMargin: 5*dp
            rightMargin: 5*dp
            topMargin: 5*dp
            bottomMargin: 10*dp
        }

        MusicControlBtn{
            id:currentListBtn
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            width: height
            text:"\uf028"
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    console.log("1")
                }
            }
        }

        Slider {
            id: sliderControl;
            z:1
            anchors{
                left: currentListBtn.right
                right: parent.right
                verticalCenter: parent.verticalCenter
            }

            background: Rectangle {
                x: sliderControl.leftPadding
                y: sliderControl.topPadding + sliderControl.availableHeight / 2 - height / 2
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

    }

}
