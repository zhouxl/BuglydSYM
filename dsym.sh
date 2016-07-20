#!/bin/bash

path="$(find . -name '*.app.dSYM')" 

if [[ $path ]]; then
	java -jar buglySymbolIos.jar -i $path
else
	echo -e "\033[31mDon\'t find the dSYM'file\033[0m"
fi

