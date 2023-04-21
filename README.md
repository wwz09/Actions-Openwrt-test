<h4 align="center">访客数 :eyes:</h4>

<p align="center">
<img  src="https://profile-counter.glitch.me/wwz09_Actions-Openwrt-test/count.svg" alt="Sub :: Visitor's Count" />
 <img width=0 height=0 src="https://profile-counter.glitch.me/wwz09/count.svg" alt="wwz09:: Visitor's Count" />
</p>


**English** | [中文](https://p3terx.com/archives/build-openwrt-with-github-actions.html)

# Actions-OpenWrt

      
          
## 固件下载
| 序号 | 设备 | 编译状态 | 下载链接 |
| :----: | :----: | :---- | :----: |
| 1 | [![](https://img.shields.io/badge/OpenWrt-CM520-blue?style=flat-square)](https://github.com/wwz09/Actions-Openwrt-test/blob/master/.github/workflows/build-openwrt-CM520.yml) | [![](https://img.shields.io/github.com/wwz09/Actions-Openwrt-test/blob/master/.github/workflows/build-openwrt-CM520.yml?branch=main&label=CM520&logo=openwrt&style=flat-square)](https://github.com/wwz09/Actions-Openwrt-test/blob/master/.github/workflows/build-openwrt-CM520.yml) | [![](https://shields.io/badge/-下载固件-informational?style=flat-square)](https://github.com/wwz09/Actions-Openwrt-test/releases) |
| 2 | [![](https://img.shields.io/badge/OpenWrt-GDOCKYT-blue?style=flat-square)](https://github.com/wwz09/Actions-Openwrt-test/blob/master/.github/workflows/build-openwrt-GDOCK-KYT.yml) | [![](https://img.shields.io/github.com/wwz09/Actions-Openwrt-test/blob/master/.github/workflows/GDOCK-KYT.yml?branch=main&label=GDOCKYT&logo=openwrt&style=flat-square)](https://github.com/wwz09/Actions-Openwrt-test/blob/master/.github/workflows/GDOCK-KYT.yml) | [![](https://shields.io/badge/-下载固件-informational?style=flat-square)](https://github.com/wwz09/Actions-Openwrt-test/releases) |

A template for building OpenWrt with GitHub Actions

## Usage

- Click the [Use this template](https://github.com/P3TERX/Actions-OpenWrt/generate) button to create a new repository.
- Generate `.config` files using [Lean's OpenWrt](https://github.com/coolsnowwolf/lede) source code. ( You can change it through environment variables in the workflow file. )
- Push `.config` file to the GitHub repository.
- Select `Build OpenWrt` on the Actions page.
- Click the `Run workflow` button.
- When the build is complete, click the `Artifacts` button in the upper right corner of the Actions page to download the binaries.

## Tips

- It may take a long time to create a `.config` file and build the OpenWrt firmware. Thus, before create repository to build your own firmware, you may check out if others have already built it which meet your needs by simply [search `Actions-Openwrt` in GitHub](https://github.com/search?q=Actions-openwrt).
- Add some meta info of your built firmware (such as firmware architecture and installed packages) to your repository introduction, this will save others' time.

## License

[MIT](https://github.com/P3TERX/Actions-OpenWrt/blob/main/LICENSE) © [**P3TERX**](https://p3terx.com)

## 特别感谢以下项目：

## Openwrt 官方项目：

https://github.com/openwrt/openwrt

## 精益大的Openwrt项目：

https://github.com/coolsnowwolf/lede

## immortalwrt 的 OpenWrt 项目：

https://github.com/immortalwrt/immortalwrt

## P3TERX 大佬的Actions-OpenWrt 项目：

https://github.com/P3TERX/Actions-OpenWrt

# SuLingGG大佬的动作编辑框架项目：

https://github.com/SuLingGG/OpenWrt-Rpi