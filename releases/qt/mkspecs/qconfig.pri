#configuration
CONFIG +=  shared qpa no_mocdepend release qt_no_framework
host_build {
    QT_ARCH = x86_64
    QT_TARGET_ARCH = x86_64
} else {
    QT_ARCH = x86_64
    QMAKE_DEFAULT_LIBDIRS = /usr/lib/gcc/x86_64-linux-gnu/4.9 /usr/lib/x86_64-linux-gnu /usr/lib /lib/x86_64-linux-gnu /lib
    QMAKE_DEFAULT_INCDIRS = /usr/include/c++/4.9 /usr/include/x86_64-linux-gnu/c++/4.9 /usr/include/c++/4.9/backward /usr/lib/gcc/x86_64-linux-gnu/4.9/include /usr/local/include /usr/lib/gcc/x86_64-linux-gnu/4.9/include-fixed /usr/include/x86_64-linux-gnu /usr/include
}
QT_CONFIG +=  minimal-config small-config medium-config large-config full-config gtk2 gtkstyle fontconfig libudev evdev xkbcommon-evdev libinput xlib xrender xcb-plugin xcb-render xcb-glx xcb-xlib xcb-sm accessibility-atspi-bridge linuxfb kms c++11 c++14 accessibility egl egl_x11 eglfs opengl shared qpa reduce_exports reduce_relocations clock-gettime clock-monotonic posix_fallocate mremap getaddrinfo ipv6ifname getifaddrs inotify eventfd threadsafe-cloexec system-jpeg system-png png system-freetype harfbuzz system-zlib mtdev nis cups iconv glib dbus dbus-linked openssl xcb xinput2 rpath alsa pulseaudio icu concurrent audio-backend release

#versioning
QT_VERSION = 5.6.0
QT_MAJOR_VERSION = 5
QT_MINOR_VERSION = 6
QT_PATCH_VERSION = 0

#namespaces
QT_LIBINFIX = 
QT_NAMESPACE = 

QT_EDITION = OpenSource

QT_COMPILER_STDCXX = 199711
QT_GCC_MAJOR_VERSION = 4
QT_GCC_MINOR_VERSION = 9
QT_GCC_PATCH_VERSION = 2
