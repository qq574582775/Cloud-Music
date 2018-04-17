import QtQuick 2.7
import QtQuick.Controls 2.2

 Button{
     property color hoveredColor: "#dddde1"
     property color clickedColor: "#c8c9cc"
     property color normalColor: "#f3f3f5"
     property bool currentItem : false;
     property string fontfamily;
     property string symbolText;                     //符号名称
     property string itemText;                       //按钮名称
     property string type;

     id:navItemBtn;
     signal btnClicked(string name);

     width: parent.width;
     height: 30*dp;
     ButtonGroup.group: narBarBtngroup

     background: Rectangle{
         id:backgroundRect;
         color: currentItem ? clickedColor:(hovered?hoveredColor:normalColor)
     }

     Rectangle{
         id:chooseItem
         visible: currentItem
         anchors.left: parent.left
         anchors.top:parent.top
         height: parent.height
         width: 3*dp
         color: titleColor
     }

     Label{
         id:symbolText_
         anchors{
             left: parent.left
             leftMargin: 1*dp
             verticalCenter: parent.verticalCenter;
         }
         width: parent.height - 2*dp
         height: parent.height - 2*dp
         text: symbolText;
         font.family: ( fontfamily == "Solid" ? (icomoonFont.name) : (regularIcomoonFont.name))

         font.pixelSize: 14*dp;
         verticalAlignment:Label.AlignVCenter;
         horizontalAlignment: Label.AlignHCenter;
     }

     Label{
         anchors{
             left: symbolText_.right
             leftMargin: 5*dp
             right: parent.right
             verticalCenter: parent.verticalCenter;
         }
         height: parent.height - 5*dp
         text: itemText;
         font.family: "Microsoft YaHei";
         font.pixelSize: 12*dp;
         verticalAlignment:Label.AlignVCenter;
     }


     MouseArea{
         anchors.fill: parent
         onClicked: {
             btnClicked(itemText);
         }
     }


     function setCurrentItemState(ok){
         currentItem = ok;
     }

     Component.onCompleted: {
         navItemBtn.btnClicked.connect(navBarBtnClicked);
     }
}
