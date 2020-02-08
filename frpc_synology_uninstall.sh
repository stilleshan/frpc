#!/bin/sh
# 删除frp
rm -rf /usr/local/frp && \
# 删除本文件
rm -rf frpc_synology_uninstall.sh
echo "============================" &&\
echo -e "\033[32m卸载成功,相关文件已清理完毕!\033[0m" && \
echo "============================"