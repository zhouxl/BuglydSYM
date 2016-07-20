#!/bin/bash
# author: 小六
# email: zhouxl72@126.com
# github: https://github.com/zhouxl/BuglydSYM
eval `cat ./buglyConfig`

path="$(find . -name '*.app.dSYM')"

if [[ $APPID ]] && [ $APPKEY ] && [ $PACKAGE ] && [ $path ]; then
	echo 输入版本号
	read version
	if [[ $version ]]; then
		java -jar buglySymbolIos.jar -i $path -u -id $APPID -key $APPKEY -package $PACKAGE -version	$version
	else
		echo -e "\033[31m必须输入版本号\033[0m"
	fi

else
	if [[ $path ]]; then
		java -jar buglySymbolIos.jar -i $path
	else
		echo -e "\033[31m没有在当前目录找到dSYM文件\033[0m"
	fi
fi
