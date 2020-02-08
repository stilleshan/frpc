#!/bin/sh
# 停止frpc
sudo systemctl stop frpc && \
# 删除frpc
rm -rf /usr/local/frp && \
# 删除frpc.service
rm -rf /lib/systemd/system/frpc.service && \
sudo systemctl daemon-reload && \
# 删除本文件
rm -rf frpc_linux_uninstall.sh
echo "============================" &&\
echo -e "\033[32m卸载成功,相关文件已清理完毕!\033[0m" && \
echo "============================"