cmd_/home/buildslave/workspace/BinaryRelease/label/x86_64/target/arm-linux-gnueabi/_build/sysroots/arm-linux-gnueabi/usr/include/linux/wimax/.install := /bin/bash scripts/headers_install.sh /home/buildslave/workspace/BinaryRelease/label/x86_64/target/arm-linux-gnueabi/_build/sysroots/arm-linux-gnueabi/usr/include/linux/wimax ./include/uapi/linux/wimax i2400m.h; /bin/bash scripts/headers_install.sh /home/buildslave/workspace/BinaryRelease/label/x86_64/target/arm-linux-gnueabi/_build/sysroots/arm-linux-gnueabi/usr/include/linux/wimax ./include/linux/wimax ; /bin/bash scripts/headers_install.sh /home/buildslave/workspace/BinaryRelease/label/x86_64/target/arm-linux-gnueabi/_build/sysroots/arm-linux-gnueabi/usr/include/linux/wimax ./include/generated/uapi/linux/wimax ; for F in ; do echo "\#include <asm-generic/$$F>" > /home/buildslave/workspace/BinaryRelease/label/x86_64/target/arm-linux-gnueabi/_build/sysroots/arm-linux-gnueabi/usr/include/linux/wimax/$$F; done; touch /home/buildslave/workspace/BinaryRelease/label/x86_64/target/arm-linux-gnueabi/_build/sysroots/arm-linux-gnueabi/usr/include/linux/wimax/.install
