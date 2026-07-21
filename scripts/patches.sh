# change the LAN IP address
sed -i 's/192.168.1.1/192.168.2.1/' package/base-files/files/bin/config_generate

# enable pwm-fan control for R4S
wget https://github.com/friendlyarm/friendlywrt/commit/cebdc1f94dcd6363da3a5d7e1e69fd741b8b718e.patch
git apply cebdc1f94dcd6363da3a5d7e1e69fd741b8b718e.patch 2>/dev/null || true
rm -f cebdc1f94dcd6363da3a5d7e1e69fd741b8b718e.patch
sed -i 's/pwmchip1/pwmchip0/' target/linux/rockchip/armv8/base-files/usr/bin/fa-fancontrol.sh target/linux/rockchip/armv8/base-files/usr/bin/fa-fancontrol-direct.sh 2>/dev/null || true

# disable IPv6 AAAA query to reduce DNS latency
sed -i '/IS_CACHED_AAAA/,/break;/s/break;/\/\/break;/' package/network/services/dnsmasq/patches/*.patch 2>/dev/null || true
