#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
# --------------------------------------------------------------
#	项目: CloudflareSpeedTest 自动更新 Hosts
#	版本: 1.0.4
#	作者: XIU2
#	项目: https://github.com/XIU2/CloudflareSpeedTest
# --------------------------------------------------------------


_UPDATE_HK() {
	echo -e "开始测速..."
	./CloudflareST  -o result_hosts_HK.txt
	grep -oE '[0-9]{1,3}(\.[0-9]{1,3}){3}' result_hosts_HK.txt  | awk '{print $0 ":443#HK"}' > ip_addresses_HK.txt
	echo -e "香港完成..."
}




_UPDATE_ADD() {
	echo -e "提交GIT..."
	git add .

	git commit -m "update"

	git push
	
	echo -e "提交完成..."
}



_UPDATE_HK

 _UPDATE_ADD


