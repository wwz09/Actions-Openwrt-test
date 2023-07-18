#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Enable Cache
echo -e 'CONFIG_DEVEL=y\nCONFIG_CCACHE=y' >> .config
# echo 'src-git small8 https://github.com/kenzok8/small-package' >>feeds.conf.default

#  删除
rm -rf target/linux/ipq60xx/patches-4.4/998-modify-qcom-ipq6018-memory.patch

#　添加新插件

# git clone https://github.com/destan19/OpenAppFilter.git package/luci-app-oaf

# git clone https://github.com/wwz09/IPQ6108.git package/IPQ6108
git clone --depth=1 https://github.com/vernesong/OpenClash.git package/luci-app-openclash
git clone https://github.com/jerrykuku/luci-app-vssr.git package/luci-app-vssr
git clone https://github.com/jerrykuku/lua-maxminddb.git package/lua-maxminddb
git clone https://github.com/gdck/luci-app-control-weburl.git package/luci-app-control-weburl
svn co https://github.com/wwz09/openwrt-packages/trunk/luci-app-control-webrestriction package/luci-app-control-webrestriction
git clone https://github.com/ywt114/luci-app-control-timewol.git package/luci-app-control-timewol

# 修改默认IP
sed -i 's/192.168.10.1/192.168.2.1/g' package/base-files/files/bin/config_generate

#　web登陆密码从password修改为空
# sed -i 's/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/root::0:0:99999:7:::/g' package/addition/default-settings/files/99-default-settings

#　固件版本号添加个人标识和日期
sed -i "s/DISTRIB_DESCRIPTION='OpenWrt '/DISTRIB_DESCRIPTION='FICHEN(\$\(TZ=UTC-8 date +%Y-%m-%d\))@OpenWrt '/g" package/addition/default-settings/files/99-default-settings

#　编译的固件文件名添加日期
sed -i 's/IMG_PREFIX:=$(VERSION_DIST_SANITIZED)/IMG_PREFIX:=$(shell TZ=UTC-8 date "+%Y%m%d")-$(VERSION_DIST_SANITIZED)/g' include/image.mk

#　修改主机名
sed -i "s/hostname='OpenWrt'/hostname='QihooV6'/g" package/base-files/files/bin/config_generate

# 添加自动挂载磁盘脚本
# mkdir -p files/etc/hotplug.d/block && wget -O files/etc/hotplug.d/block/30-usbmount https://raw.githubusercontent.com/fichenx/P3TERX_Actions-OpenWrt/main/files/etc/hotplug.d/block/30-usbmount && chmod 755 files/etc/hotplug.d/block/30-usbmount
