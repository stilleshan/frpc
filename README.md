# frpc
## 项目简介
基于 [fatedier/frp](https://github.com/fatedier/frp) 原版 frp 内网穿透客户端 frpc 的一键安装卸载脚本和 docker 镜像.支持群晖NAS,Linux 服务器和 docker 等多种环境安装部署.

- GitHub [stilleshan/frpc](https://github.com/stilleshan/frpc)
- Docker [stilleshan/frpc](https://hub.docker.com/r/stilleshan/frpc)
> *docker image support for X86 and ARM*

## 更新
- **2024-03-03** 更新到新版本,支持 toml 配置文件.
- **2021-05-31** 更新国内镜像方便使用
- **2021-05-31** 目前 X86 群晖 DMS 7.0 可直接使用 Linux 版本脚本,已实测.由于没有 ARM 版可尝试,请自行尝试.
- **2021-05-31** 更新 Linux 一键安装脚本同时支持 X86 和 ARM
- **2021-05-29** 更新从`0.36.2`版本起 docker 镜像同时支持 X86 和 ARM

## 使用
以下分为四种部署方法,请根据实际情况自行选择:

1. 群晖 NAS docker 安装 **[支持 docker 的群晖机型首选]**
2. 群晖 NAS 一键脚本安装 **[不支持 docker 的群晖机型]**
3. Linux 服务器 一键脚本安装 **[内网 Linux 服务器或虚拟机]**
4. Linux 服务器 docker 安装 **[内网 Linux 服务器或虚拟机]**

---

### 1. 群晖 NAS docker 安装 **[支持 docker 的群晖机型首选]** 
[详情点击查看教程](https://www.ioiox.com/archives/26.html)

### 2. 群晖 NAS 一键脚本安装 **[不支持 docker 的群晖机型]**
[详情点击查看教程](https://www.ioiox.com/archives/6.html)

### 3. Linux 服务器 一键脚本安装
> *本脚本目前同时支持 Linux X86 和 ARM 架构*

安装
```shell
wget https://raw.githubusercontent.com/stilleshan/frpc/master/frpc_linux_install.sh && chmod +x frpc_linux_install.sh && ./frpc_linux_install.sh
# 以下为国内镜像
wget https://ghfast.top/https://raw.githubusercontent.com/LoserLiunian/frpc/master/frpc_linux_install.sh && chmod +x frpc_linux_install.sh && ./frpc_linux_install.sh
```

使用
```shell
vi /usr/local/frp/frpc.toml
# 修改 frpc.toml 配置
sudo systemctl restart frpc
# 重启 frpc 服务即可生效
```

卸载
```shell
wget https://raw.githubusercontent.com/stilleshan/frpc/master/frpc_linux_uninstall.sh && chmod +x frpc_linux_uninstall.sh && ./frpc_linux_uninstall.sh
# 以下为国内镜像
wget https://ghfast.top/https://raw.githubusercontent.com/stilleshan/frpc/master/frpc_linux_uninstall.sh && chmod +x frpc_linux_uninstall.sh && ./frpc_linux_uninstall.sh
```

### 4. Linux 服务器 docker 安装
为避免因 **frpc.toml** 文件的挂载,格式或者配置的错误导致容器无法正常运行并循环重启.请确保先配置好 **frpc.toml** 后在运行启动.

**git clone** 本仓库,并正确配置 **frpc.toml** 文件.
```shell
git clone https://github.com/stilleshan/frpc
# git clone 本仓库镜像
git clone https://ghfast.top/https://github.com/stilleshan/frpc
# 国内镜像
vi /root/frpc/frpc.toml
# 配置 frpc.toml 文件
```

执行以下命令启动服务
```shell
docker run -d --name=frpc --restart=always -v /root/frpc/frpc.toml:/frp/frpc.toml stilleshan/frpc
```
> 以上命令 -v 挂载的目录是以 git clone 本仓库为例,也可以在任意位置手动创建 frpc.toml 文件,并修改命令中的挂载路径.

服务运行中修改 **frpc.toml** 配置后需重启 **frpc** 服务.
```shell
vi /root/frp/frpc.toml
# 修改 frpc.toml 配置
docker restart frpc
# 重启 frpc 容器即可生效
```

## 链接
- Blog [www.ioiox.com](https://www.ioiox.com)
- GitHub [stilleshan/frpc](https://github.com/stilleshan/frpc)
- Docker Hub [stilleshan/frpc](https://hub.docker.com/r/stilleshan/frpc)
- Docker [docker.ioiox.com](https://docker.ioiox.com)
- 原版frp项目 [fatedier/frp](https://github.com/fatedier/frp)
- [群晖NAS使用Docker安装配置frpc内网穿透教程](https://www.ioiox.com/archives/26.html) 
- [群晖NAS安装配置免费frp内网穿透教程](https://www.ioiox.com/archives/6.html)
- [新手入门 - 详解 frp 内网穿透 frpc.toml 配置](https://www.ioiox.com/archives/79.html)
