# NanoPi R4S OpenWrt 固件 (个人自用)

基于 OpenWrt 官方稳定版构建的 NanoPi R4S 固件。

## 固件特性
- 基于 [OpenWrt] 最新稳定版构建
- 支持 Docker / Docker Compose
- 预装 OpenClash、Easytier、Vlmcsd 等常用插件
- 支持 PWM 风扇控制
- LAN 口默认 IP: 192.168.2.1
- 默认用户名: root, 密码: password

## 本地构建
```bash
git clone -b openwrt-25.12 --single-branch https://git.openwrt.org/openwrt/openwrt.git
cd openwrt
./scripts/feeds update -a
./scripts/feeds install -a
# 复制本仓库的 config.seed 合并为 .config
make defconfig
make download -j
make -j$(nproc)
```

[OpenWrt]: https://openwrt.org
