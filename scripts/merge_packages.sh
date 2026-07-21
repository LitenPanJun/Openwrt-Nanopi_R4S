function merge_package(){
    repo=`echo $1 | rev | cut -d'/' -f 1 | rev`
    pkg=`echo $2 | rev | cut -d'/' -f 1 | rev`
    find package/ -follow -name $pkg -not -path "package/custom/*" | xargs -rt rm -rf
    git clone --depth=1 --single-branch $1
    mv $2 package/custom/
    rm -rf $repo
}

rm -rf package/custom; mkdir package/custom

# luci-theme-glass - from community source
# https://github.com/rchen14b/luci-theme-glass
merge_package https://github.com/rchen14b/luci-theme-glass luci-theme-glass

# luci-app-openclash 和 luci-app-easytier 请手动拷贝至 package/ 目录下
# 拷贝命令示例:
#   cp -r /path/to/luci-app-openclash openwrt/package/
#   cp -r /path/to/luci-app-easytier openwrt/package/
#   cp -r /path/to/easytier openwrt/package/
