DEFINES += MPA_SAMPLE1
DEFINES += QCUSTOMPLOT_USE_OPENGL
QT       += core gui network serialport concurrent

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets printsupport

QT += sql

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncom ment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

TARGET = Radar

SOURCES += \
    Managers/Mng_Rdb.cpp \
    Radar.cpp \
    main.cpp \
    userlogin.cpp

HEADERS += \
    Managers/Mng_Rdb.h \
    Radar.h \
    userlogin.h

FORMS += \
    Radar.ui \
    Forms/userlogin.ui
contains(DEFINES, MPA_SAMPLE3): _PATH = $$PWD/RadarActive/RadarActive.pri
contains(DEFINES, MPA_SAMPLE2): _PATH = $$PWD/RadarActive/RadarActive.pri
contains(DEFINES, MPA_SAMPLE1): _PATH = NoPath

include("$$_PATH")

include("RadarPassive/RadarPassive.pri")
include("BoardInterface/BoardInterface.pri")
include("Tester/Tester.pri")
include("Utility/Utility.pri")
include("geoview/geoview.pri")
include("AIS/ais.pri")
include("QgisBaseMap/QgisBaseMap.pri")



# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

RESOURCES += \
    res.qrc

DISTFILES += \
    uml.qmodel
