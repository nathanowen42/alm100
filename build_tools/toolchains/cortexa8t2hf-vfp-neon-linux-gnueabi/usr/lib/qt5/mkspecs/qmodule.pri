CONFIG +=  cross_compile compile_examples silent qpa largefile neon pcre
QT_BUILD_PARTS +=  examples libs tools
QT_NO_DEFINES =  ACCESSIBILITY ALSA CUPS EGL_X11 FONTCONFIG GLIB ICONV IMAGEFORMAT_JPEG MITSHM NIS OPENVG SESSIONMANAGER SHAPE STYLE_GTK TABLET XCURSOR XFIXES XINERAMA XINPUT XKB XRANDR XRENDER XSYNC XVIDEO ZLIB
QT_QCONFIG_PATH = 
host_build {
    QT_CPU_FEATURES.arm =  neon
} else {
    QT_CPU_FEATURES.arm =  neon
}
QT_COORD_TYPE = double
QT_LFLAGS_ODBC   = -lodbc
OPENSSL_LIBS = -lssl -lcrypto
OE_QMAKE_AR = arm-linux-gnueabihf-ar
OE_QMAKE_CC = arm-linux-gnueabihf-gcc  -march=armv7-a -marm -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a8 --sysroot=/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm
OE_QMAKE_CFLAGS =  -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types
OE_QMAKE_COMPILER = arm-linux-gnueabihf-gcc  -march=armv7-a -marm -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a8 --sysroot=/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm
OE_QMAKE_CXX = arm-linux-gnueabihf-g++  -march=armv7-a -marm -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a8 --sysroot=/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm
OE_QMAKE_CXXFLAGS =  -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types
OE_QMAKE_LDFLAGS =  -L/opt/linaro-2013.03/arm-linux-gnueabihf/lib -Wl,-rpath-link,/opt/linaro-2013.03/arm-linux-gnueabihf/lib -Wl,-O1 -Wl,--hash-style=gnu
OE_QMAKE_LINK = arm-linux-gnueabihf-g++  -march=armv7-a -marm -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a8 --sysroot=/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm
OE_QMAKE_STRIP = echo
styles += mac fusion windows
DEFINES += QT_NO_MTDEV
QT_CFLAGS_PULSEAUDIO = -D_REENTRANT -I/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/glib-2.0 -I/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/lib/glib-2.0/include 
QT_LIBS_PULSEAUDIO = -lpulse-mainloop-glib -lpulse -lglib-2.0 
QMAKE_INCDIR_LIBUDEV = 
QMAKE_LIBS_LIBUDEV = -ludev -lrt 
sql-drivers = 
sql-plugins = 
