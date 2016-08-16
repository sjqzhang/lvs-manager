#!/bin/bash
#LVS 平台客户端配置
#20160720

#安装salt-minion
yum -y install salt-minion 

#配置minion

sed -i 's@#master: salt@master: 10.3.155.198@g' /etc/salt/minion

echo -n "Enter lvs-node name:" 
read name
echo "你输入的salt-minion:$name"
sed -i "s@#id:@id: $name@g" /etc/salt/minion

#启动minion
/etc/init.d/salt-minion start

#安装supervisord
yum -y install supervisor

#创建agent环境
mkdir /data/monitor_agent/data -p
touch /data/monitor_agent/data/lvstraffic
mkdir /data/monitor_agent/tmp
mkdir -p /data/log/ipvs


#启动supervisord
supervisord -c /data/monitor_agent/supervisord.conf

