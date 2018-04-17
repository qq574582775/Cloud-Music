import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3


Rectangle{
    width: height
    property alias text: musicControlBtnText.text
    property alias fontfamily: musicControlBtnText.font.family;
    property alias color : musicControlBtnText.color
    Label{
        id:musicControlBtnText
        anchors.fill: parent
        font.family: icomoonFont.name
        font.pixelSize: 15*dp;
        verticalAlignment:Label.AlignVCenter;
        horizontalAlignment: Label.AlignHCenter;
        color: "#999999"
    }
}
