#!/bin/bash

PWD_MAIN=`pwd`
cd "$PWD_MAIN";

moss_path="./moss_script.pl";
moss_language="verilog"
moss_cmd="$moss_path -l $moss_language";
code_file="example_code.v";

file_pwd="";
pathArr=()

for file in */; do

	eachFile=`echo $file | sed 's/_.*//'`;

	cd "$file";
	
	file_pwd=`pwd`;
	
	file_pwd="${file_pwd// /\ }"
	
	file="${file// /\ }"
	
	if [[ -f "$code_file" ]]; then
		#pathArr+=("$file_pwd/$code_file")
		pathArr+=("$file/$code_file")
	fi;

	cd "$PWD_MAIN";
done

#echo "${pathArr[*]}";

for eachPath in "${pathArr[@]}"
do
	moss_cmd+=" $eachPath"; #echo "$eachPath"
done

echo "$moss_cmd";

echo `eval "$moss_cmd"`;
