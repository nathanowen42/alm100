cmd_/home/buildslave/workspace/BinaryRelease/label/x86_64/target/arm-linux-gnueabi/_build/sysroots/arm-linux-gnueabi/usr/include/uapi/.install := /bin/bash scripts/headers_install.sh /home/buildslave/workspace/BinaryRelease/label/x86_64/target/arm-linux-gnueabi/_build/sysroots/arm-linux-gnueabi/usr/include/uapi ./include/uapi ; /bin/bash scripts/headers_install.sh /home/buildslave/workspace/BinaryRelease/label/x86_64/target/arm-linux-gnueabi/_build/sysroots/arm-linux-gnueabi/usr/include/uapi ./include ; /bin/bash scripts/headers_install.sh /home/buildslave/workspace/BinaryRelease/label/x86_64/target/arm-linux-gnueabi/_build/sysroots/arm-linux-gnueabi/usr/include/uapi ./include/generated/uapi ; for F in ; do echo "\#include <asm-generic/$$F>" > /home/buildslave/workspace/BinaryRelease/label/x86_64/target/arm-linux-gnueabi/_build/sysroots/arm-linux-gnueabi/usr/include/uapi/$$F; done; touch /home/buildslave/workspace/BinaryRelease/label/x86_64/target/arm-linux-gnueabi/_build/sysroots/arm-linux-gnueabi/usr/include/uapi/.install
