import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Rectangle {
    property color backGroundColour: "#f3f3f5";  //边框颜色
    color: backGroundColour

    ButtonGroup{
        id:narBarBtngroup

    }

    ListModel{
        id:navbarListmodel
//        ListElement{
//            type:"推荐"
//            symbolText_:"\uf002"
//            itemText_:"搜索"
//            fontfamily_:"Solid"
//        }
        ListElement{
            type:"推荐"
            symbolText_:"\uf001"
            itemText_:"发现音乐"
            fontfamily_:"Solid"
        }
        ListElement{
            type:"推荐"
            symbolText_:"\uf26c"
            itemText_:"MV"
            fontfamily_:"Solid"
        }
        ListElement{
            type:"推荐"
            symbolText_:"\uf0c0"
            itemText_:"朋友"
            fontfamily_:"Solid"
        }
        ListElement{
            type:"我的音乐"
            symbolText_:"\uf192"
            itemText_:"本地音乐"
            fontfamily_:"Solid"
        }
        ListElement{
            type:"我的音乐"
            symbolText_:"\uf019"
            itemText_:"下载管理"
            fontfamily_:"Solid"
        }
        ListElement{
            type:"我的音乐"
            symbolText_:"\uf017"
            itemText_:"最近播放"
            fontfamily_:"Regular"
        }
        ListElement{
            type:"我的音乐"
            symbolText_:"\uf0c2"
            itemText_:"我的音乐云盘"
            fontfamily_:"Solid"
        }
        ListElement{
            type:"我的音乐"
            symbolText_:"\uf2ce"
            itemText_:"我的电台"
            fontfamily_:"Solid"
        }
        ListElement{
            type:"我的音乐"
            symbolText_:"\uf0fe"
            itemText_:"我的收藏"
            fontfamily_:"Solid"
        }

        ListElement{
            type:"创建的歌单"
            symbolText_:"\uf004"
            itemText_:"我喜欢的音乐"
            fontfamily_:"Regular"
        }
        ListElement{
            type:"创建的歌单"
            symbolText_:"\uf03a"
            itemText_:"RAiNBOW计划 热门50单曲"
            fontfamily_:"Solid"
        }

        ListElement{
            type:"收藏的歌单"
            symbolText_:"\uf03a"
            itemText_:"戴上耳机 • 享受重低音（1）"
            fontfamily_:"Solid"
        }
        ListElement{
            type:"收藏的歌单"
            symbolText_:"\uf03a"
            itemText_:"戴上耳机 • 享受重低音（2）"
            fontfamily_:"Solid"
        }

    }


    ListView {
            id: navbarListView
            width: parent.width
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            model: navbarListmodel
            delegate: NavBarBtn { symbolText: symbolText_; itemText: itemText_;fontfamily:fontfamily_;}

            section.property: "type"
            section.criteria: ViewSection.FullString
            section.delegate: sectionHeading

            ScrollBar.vertical: ScrollBar{

            }

        }




    function navBarBtnClicked(name)
    {
        var aaa = narBarBtngroup.buttons.length;
        for(var i=0;i<narBarBtngroup.buttons.length;++i)
        {
            if(name!==narBarBtngroup.buttons[i].itemText)
                narBarBtngroup.buttons[i].setCurrentItemState(false);
            else
                narBarBtngroup.buttons[i].setCurrentItemState(true);
        }
    }

    Component{
        id:sectionHeading
        Rectangle{
            width: navbarListView.width
            height: 30*dp
            color: backGroundColour
            Label {
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 3*dp
                anchors.bottom: parent.bottom
                text: section == "top" ? "":section
                font{family:"Microsoft YaHei"; pixelSize: 11*dp}
                verticalAlignment:Label.AlignVCenter;
                color: "#999999"
            }

        }
    }
}
