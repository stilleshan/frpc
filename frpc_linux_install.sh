#!/bin/sh
FRP_VERSION="0.33.0"
REPO="stilleshan/frpc"
WORK_PATH=$(dirname $(readlink -f $0))

# 创建frp文件夹
mkdir -p /usr/local/frp && \
# 下载并移动frpc文件
wget -P ${WORK_PATH} https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz && \
tar -zxvf frp_${FRP_VERSION}_linux_amd64.tar.gz && \
cd frp_${FRP_VERSION}_linux_amd64 && \
mv frpc /usr/local/frp && \
# 下载frpc.in和frpc.service
wget -P /usr/local/frp https://raw.githubusercontent.com/${REPO}/master/frpc.ini && \
wget -P /lib/systemd/system https://raw.githubusercontent.com/${REPO}/master/frpc.service && \
systemctl daemon-reload && \
# 启动frpc
sudo systemctl start frpc && \
sudo systemctl enable frpc && \
# 删除多余文件
cd ${WORK_PATH} && \
rm -rf frp_${FRP_VERSION}_linux_amd64 frp_${FRP_VERSION}_linux_amd64.tar.gz frpc_linux_install.sh
echo "=======================================================" &&\
echo -e "\033[32m安装成功,请先修改 frpc.ini 文件,确保格式及配置正确无误!\033[0m" && \
echo -e "\033[31mvi /usr/local/frp/frpc.ini \033[0m" && \
echo -e "\033[32m修改完毕后执行以下命令重启服务:\033[0m" && \
echo -e "\033[31msudo systemctl restart frpc\033[0m" && \
echo "======================================================="