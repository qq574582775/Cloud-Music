QT += quick
QT += multimedia
QT += sql
CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0



#INCLUDEPATH += $$PWD/libzplay-2.02-sdk/C++
#DEPENDPATH += $$PWD/libzplay-2.02-sdk/C++
#win32:CONFIG(release, debug|release): LIBS += -L$$PWD/libzplay-2.02-sdk/C++/ -llibzplay
#else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/libzplay-2.02-sdk/C++/ -llibzplay



#INCLUDEPATH += F:/GitHub/Cloud-Music/libzplay-2.02-sdk/C++/
#LIBS += F:/GitHub/Cloud-Music/libzplay-2.02-sdk/C++/libzplay.lib
#win32:CONFIG(release, debug|release): LIBS += -L F:/GitHub/Cloud-Music/libzplay-2.02-sdk/C++/ -llibzplay
#else:win32:CONFIG(debug, debug|release): LIBS += -L F:/GitHub/Cloud-Music/libzplay-2.02-sdk/C++/ -llibzplay

SOURCES += main.cpp \
    player.cpp \
    localmusicmodel.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    player.h \
    localmusicmodel.h



unix:!macx|win32: LIBS += -L$$PWD/libs/libzplay/ -llibzplay

INCLUDEPATH += $$PWD/libs/libzplay
DEPENDPATH += $$PWD/libs/libzplay

win32:!win32-g++: PRE_TARGETDEPS += $$PWD/libs/libzplay/libzplay.lib
else:unix:!macx|win32-g++: PRE_TARGETDEPS += $$PWD/libs/libzplay/libzplay.a
