function merge_package(){
    repo=`echo $1 | rev | cut -d'/' -f 1 | rev | sed 's/\.git$//'`
    pkg=`echo $2 | rev | cut -d'/' -f 1 | rev`
    find package/ -follow -name $pkg -not -path "package/custom/*" | xargs -rt rm -rf
    git clone --depth=1 --single-branch $1
    mv $2 package/custom/
    rm -rf $repo
}

rm -rf package/custom; mkdir package/custom

# luci-theme-glass - Apple 风格玻璃主题
merge_package https://github.com/rchen14b/luci-theme-glass luci-theme-glass

# luci-app-openclash - OpenClash 控制面板
merge_package https://github.com/vernesong/OpenClash.git OpenClash/luci-app-openclash

# EasyTier 全家桶 (luci-app-easytier + easytier 后端)
# 两个包来自同一仓库的不同子目录，一次性克隆后分别移动
git clone --depth=1 https://github.com/EasyTier/luci-app-easytier.git /tmp/easytier-full
mv /tmp/easytier-full/luci-app-easytier package/custom/
mv /tmp/easytier-full/easytier package/custom/
rm -rf /tmp/easytier-full
