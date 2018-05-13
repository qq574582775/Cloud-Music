import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2
import io.qt.CloudMusic 1.0


Page {
    property int interval : 20*dp
    LocalMusicModel{id:localmusic;}
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
            font.pixelSize: 20
            font.bold: true
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
            text: qsTr("0首音乐，")
            font.pixelSize: 14
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignBottom
            anchors.bottom: title.bottom
            anchors.bottomMargin: 3
            anchors.left: title.right
            anchors.leftMargin: 20
        }

        Label{
            id: chooseDir
            y: 37
            width: 66
            height: 20
            anchors.bottom: title.bottom
            anchors.bottomMargin: 3
            anchors.left: musicNum.right
            anchors.leftMargin: 10
            text: qsTr("选择目录")
            color: "#0C9DDA"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignBottom
            font.pixelSize: 14
            MouseArea{
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
            }
        }

        Rectangle {
            id: listBtn
            x: 500
            y: 37
            width: 30
            height: 30
            //text: qsTr("1")
            anchors.bottom: title.bottom
            anchors.bottomMargin: 0
            anchors.right: singerBtn.left
            anchors.rightMargin: 0
            radius: 2
            Label{
                anchors.fill: parent
                font.family: icomoonFont.name
                //font.pixelSize: 15*dp;
                verticalAlignment:Label.AlignVCenter;
                horizontalAlignment: Label.AlignHCenter;
                color: "#999999"
                text: "\uf039";
            }

        }

        Rectangle {
            id: singerBtn
            x: 509
            y: 37
            width: 30
            height: 30
            //text: qsTr("2")
            anchors.bottom: title.bottom
            anchors.bottomMargin: 0
            anchors.right: specialBtn.left
            anchors.rightMargin: 0
            radius: 2
            Label{
                anchors.fill: parent
                font.family: icomoonFont.name
                //font.pixelSize: 15*dp;
                verticalAlignment:Label.AlignVCenter;
                horizontalAlignment: Label.AlignHCenter;
                color: "#999999"
                text: "\uf007";
            }
        }

        Rectangle {
            id: specialBtn
            x: 534
            y: 37
            width: 30
            height: 30
            //text: qsTr("3")
            anchors.bottom: title.bottom
            anchors.bottomMargin: 0
            anchors.right: folder.left
            anchors.rightMargin: 0
            radius: 2
            Label{
                anchors.fill: parent
                font.family: icomoonFont.name
                //font.pixelSize: 15*dp;
                verticalAlignment:Label.AlignVCenter;
                horizontalAlignment: Label.AlignHCenter;
                color: "#999999"
                text: "\uf192";
            }
        }

        Rectangle {
            id: folder
            x: 558
            y: 37
            width: 30
            height: 30
            //text: qsTr("4")
            anchors.bottom: title.bottom
            anchors.bottomMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 20
            radius: 2
            Label{
                anchors.fill: parent
                font.family: icomoonFont.name
                //font.pixelSize: 15*dp;
                verticalAlignment:Label.AlignVCenter;
                horizontalAlignment: Label.AlignHCenter;
                color: "#999999"
                text: "\uf07b";
            }
        }

        Rectangle {
            id: interval
            y: 73
            height: 3
            border.width: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            color: "#f0f0f0"
        }

        Rectangle{
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: interval.bottom
            anchors.topMargin: 0

            Rectangle {
                id: rectangle2
                color: "#ffffff"
                anchors.fill: parent
                visible: (localmusic.m_musicNum === 0)
                Button {
                    id: button
                    x: 232
                    y: 181
                    width: 240
                    height: 75
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    background: Rectangle{
                        radius: 5
                        color: button.hovered ?  "#1167A8" : "#0C73C2"
                        Label{
                            anchors.fill: parent
                            text: qsTr("选择本地文件夹")
                            color: "#ffffff"
                            verticalAlignment:Label.AlignVCenter;
                            horizontalAlignment: Label.AlignHCenter;
                            font{
                                family: "Microsoft YaHei";
                                pixelSize: 20
                            }
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: hovered ?  Qt.PointingHandCursor : Qt.ArrowCursor
                        onClicked: selecttMusicDirDlg.open();
                    }
                }


                Label {
                    id: label
                    x: 231
                    y: 66
                    width: 177
                    height: 32
                    text: qsTr("请选择本地音乐")
                    font.bold: true
                    anchors.bottom: label1.top
                    anchors.bottomMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font{
                        family: "Microsoft YaHei";
                        pixelSize: 18
                        bold: true;
                    }

                }

                Label {
                    id: label1
                    x: 136
                    y: 117
                    width: 369
                    height: 32
                    text: qsTr("升级本地音乐为高品质并和朋友分享！")
                    anchors.bottom: button.top
                    anchors.bottomMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font{
                        family: "Microsoft YaHei";
                        pixelSize: 16
                    }
                }

            }


            TableView{
                id: tableview
                anchors.fill: parent
                visible: localmusic.m_musicNum >0
                backgroundVisible: false;
                frameVisible: false;
                //itemDelegate: StandardTabelItemDelegate{} //添加自己喜欢的代理，这个就不用说了吧
                //headerDelegate: headerDele;  //表头委托
                //rowDelegate: rowDele;   //行委托
                model: localmusic

                TableViewColumn {
                          role: "title"
                          title: qsTr("标题")
                          width: 300
                      }
                TableViewColumn {
                          role: "singer"
                          title: qsTr("歌手")
                          width: 300
                      }
                TableViewColumn {
                          role: "album"
                          title: qsTr("专辑")
                          width: 300
                      }
                TableViewColumn {
                          role: "duration"
                          title: qsTr("时长")
                          width: 300
                      }
            }

        }
    }

    FileDialog {
        id: selecttMusicDirDlg
        title: qsTr("选择音乐所在目录：")
        selectFolder :true
        onAccepted: {
            localmusic.reloadMusicRecord(selecttMusicDirDlg.fileUrls);
            //console.log("You chose: " + selecttMusicDirDlg.fileUrls)
        }
        onRejected: {
            console.log("onRejected" )
        }
        Component.onCompleted: visible = false
    }
}
