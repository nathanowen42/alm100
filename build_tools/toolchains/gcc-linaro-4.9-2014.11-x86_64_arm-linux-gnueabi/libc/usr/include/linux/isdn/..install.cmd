cmd_/home/buildslave/workspace/BinaryRelease/label/x86_64/target/arm-linux-gnueabi/_build/sysroots/arm-linux-gnueabi/usr/include/linux/isdn/.install := /bin/bash scripts/headers_install.sh /home/buildslave/workspace/BinaryRelease/label/x86_64/target/arm-linux-gnueabi/_build/sysroots/arm-linux-gnueabi/usr/include/linux/isdn ./include/uapi/linux/isdn capicmd.h; /bin/bash scripts/headers_install.sh /home/buildslave/workspace/BinaryRelease/label/x86_64/target/arm-linux-gnueabi/_build/sysroots/arm-linux-gnueabi/usr/include/linux/isdn ./include/linux/isdn ; /bin/bash scripts/headers_install.sh /home/buildslave/workspace/BinaryRelease/label/x86_64/target/arm-linux-gnueabi/_build/sysroots/arm-linux-gnueabi/usr/include/linux/isdn ./include/generated/uapi/linux/isdn ; for F in ; do echo "\#include <asm-generic/$$F>" > /home/buildslave/workspace/BinaryRelease/label/x86_64/target/arm-linux-gnueabi/_build/sysroots/arm-linux-gnueabi/usr/include/linux/isdn/$$F; done; touch /home/buildslave/workspace/BinaryRelease/label/x86_64/target/arm-linux-gnueabi/_build/sysroots/arm-linux-gnueabi/usr/include/linux/isdn/.install
