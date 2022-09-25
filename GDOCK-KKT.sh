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

# '修改默认IP'

sed -i 's/192.168.1.1/192.168.3.1/g' package/base-files/files/bin/config_generate


# '修改默认主机名'
sed -i 's/OpenWrt/GDOCK-KKT/g' package/base-files/files/bin/config_generate

# 删除 '访问时间控制'
rm -rf feeds/luci/applications/luci-app-accesscontrol 

# 删除 'ipsec-vpn（VPN服务器）'
rm -rf feeds/luci/applications/luci-app-ipsec-vpnd

# 拷贝mac80211.sh
# rm -rf package/kernel/mac80211/files/lib/wifi
# cp -rf $GITHUB_WORKSPACE/diy/KKT/wifi package/kernel/mac80211/files/lib/wifi


# 拷贝wireless文件到files目录
chmod 0755 files
cp -f ../diy/wirelessK files/etc/config/wireless

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

# 编译多主题时,设置固件默认主题（可自行修改您要的,主题名称必须对,比如下面代码的[argon],和肯定编译了该主题,要不然进不了后台）
sed -i "/exit 0/i\uci set luci.main.mediaurlbase='/luci-static/argonne' && uci commit luci" "$FIN_PATH"

# '修改默认主题为argonne'
# sed -i 's/config internal themes/config internal themes\n    option argonne  \"\/luci-static\/argonne\"/g' feeds/luci/modules/luci-base/root/etc/config/luci

# '去除默认bootstrap主题'
sed -i '/set luci.main.mediaurlbase=\/luci-static\/Bootstrap/d' feeds/luci/themes/luci-theme-Bootstrap/root/etc/uci-defaults/30_luci-theme-Bootstrap


#'修改WIFI国家区域'
# sed -i 's/US/CN/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

#修改默认无线名称
# sed -i 's/OpenWrt/KKT/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修改输出文件名
sed -i 's/IMG_PREFIX:=$(VERSION_DIST_SANITIZED)/IMG_PREFIX:=KKT-$(shell date +%Y%m%d)-$(VERSION_DIST_SANITIZED)/g' include/image.mk

# '修改连接数数'
sed -i 's/net.netfilter.nf_conntrack_max=.*/net.netfilter.nf_conntrack_max=65535/g' package/kernel/linux/files/sysctl-nf-conntrack.conf

# '修改概览里时间显示为中文数字'
sed -i 's/os.date()/os.date("%Y年%m月%d日") .. " " .. translate(os.date("%A")) .. " " .. os.date("%X")/g' package/lean/autocore/files/arm/index.htm

# '首页增加CPU频率动态显示'
cp -f ../diy/mod-index.htm ./feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm

