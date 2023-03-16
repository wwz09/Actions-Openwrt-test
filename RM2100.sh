#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-par3.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 修改默认IP

sed -i 's/192.168.1.1/192.168.3.1/g' package/base-files/files/bin/config_generate

#修改默认主机名
sed -i 's/OpenWrt/RM2100/g' package/base-files/files/bin/config_generate

# 删除 '访问时间控制'
rm -rf feeds/luci/applications/luci-app-accesscontrol 

# 删除 'ipsec-vpn（VPN服务器）'
rm -rf feeds/luci/applications/luci-app-ipsec-vpnd

# weburl 文件加执行权限
chmod 7777 files/etc/init.d/weburl 

# '应用过滤插件'
git clone https://github.com/destan19/OpenAppFilter.git package/luci-app-oaf

# '管控插件'
# git clone https://github.com/gdck/luci-app-control-weburl.git package/luci-app-control-weburl

# '添加argon-config 使用最新argon
# rm -rf package/lean/luci-theme-argon
# git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon
# git clone https://github.com/jerrykuku/luci-app-argon-config.git package/lean/luci-app-argon-config

#  '添加新的主题包'
# git clone https://github.com/sypopo/luci-theme-argon-mc.git package/lean/luci-theme-argon-mc
# git clone https://github.com/YL2209/luci-theme-argon-lr.git package/lean/luci-theme-argon-lr

# '添加luci-app-diskman
https://github.com/lisaac/luci-app-diskman.git package/lean/luci-app-diskman

# '去除默认bootstrap主题'
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

# '修改默认主题为argonne'
sed -i 's/luci-theme-bootstrap/luci-theme-argonne/g' ./feeds/luci/collections/luci/Makefile

#修改菜单级包名
sed -i 's/"管理权"/"密码修改"/g' feeds/luci/modules/luci-base/po/zh-cn/base.po

sed -i 's/TTYD 终端/超级终端/g' feeds/luci/applications/luci-app-ttyd/po/zh-cn/terminal.po
#sed -i 's/\/bin\/login/\/bin\/login -f root/' feeds/packages/utils/ttyd/files/ttyd.config

sed -i 's/解锁网易云灰色歌曲/云音乐解锁/g' feeds/luci/applications/luci-app-unblockmusic/po/zh-cn/unblockmusic.po


#'修改WIFI国家区域'
sed -i 's/US/CN/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

#修改默认无线名称
sed -i 's/OpenWrt/KYT/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

#修改无线加密及密码
sed -i 's/encryption=none/encryption=psk-mixed+ccmp\n            set wireless.default_radio${devidx}.key=abc5124937,\n/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修改输出文件名
sed -i 's/IMG_PREFIX:=$(VERSION_DIST_SANITIZED)/IMG_PREFIX:=KKT-$(shell date +%Y%m%d)-$(VERSION_DIST_SANITIZED)/g' include/image.mk

# '修改连接数数'
sed -i 's/net.netfilter.nf_conntrack_max=.*/net.netfilter.nf_conntrack_max=65535/g' package/kernel/linux/files/sysctl-nf-conntrack.conf

# '修改概览里时间显示为中文数字'
sed -i 's/os.date()/os.date("%Y年%m月%d日") .. " " .. translate(os.date("%A")) .. " " .. os.date("%X")/g' package/lean/autocore/files/arm/index.htm

