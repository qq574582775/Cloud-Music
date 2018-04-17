import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3


Page{
    property int interval : 20*dp

    Rectangle{
        id: rectangle1
        anchors.fill: parent
        color: "#fefefe"
        Rectangle{
            id:searchTextEditBorder
            anchors.top: parent.top
            anchors.topMargin: interval
            anchors.left: parent.left
            anchors.leftMargin: interval
            anchors.right:parent.right
            anchors.rightMargin: interval
            height:  40*dp
            z:1

            border{
                color: "#999999"
                width: 1*dp
            }

            TextEdit {
                id: searchTextEdit
                height: 40*dp
                text: qsTr("搜索音乐、歌手、歌词、用户")

                anchors.top: searchTextEditBorder.top
                anchors.left: searchTextEditBorder.left
                anchors.right: rectangle.left
                anchors.leftMargin: 6*dp

                font.wordSpacing: 4
                selectionColor: "#00801c"
                font.pixelSize: 15;
                font.family: "Microsoft YaHei";
                verticalAlignment:TextEdit.AlignVCenter;
            }

            Rectangle{
                id: rectangle
                anchors{
                    right:searchTextEditBorder.right
                    rightMargin: 1*dp
                    top:searchTextEditBorder.top
                    topMargin: 1*dp
                    bottom: searchTextEditBorder.bottom
                    bottomMargin: 1*dp

                }
                height: searchTextEdit.height
                width: height
                Label{
                    id:musicControlBtnText
                    font.family: icomoonFont.name
                    font.pixelSize: 20;
                    verticalAlignment:Label.AlignVCenter;
                    horizontalAlignment: Label.AlignHCenter;
                    color: "#999999"
                    text:"\uf002"
                    anchors.fill: parent
                }
            }
        }

        Rectangle{
            id:hotSearch
            anchors{
                top:parent.top
                topMargin: searchTextEditBorder.height+interval
                bottom:parent.bottom
                left: parent.left
                leftMargin: interval
            }
            width: parent.width/2
            color: "#123456"
        }
    }

}
