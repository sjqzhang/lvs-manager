#!/bin/bash
#LVS 平台环境配置
#20160720


#下载pip
wget https://bootstrap.pypa.io/get-pip.py

#安装pip
python get-pip.py

#下载lvs_manage
cd /data;mkdir /data/lvs-manager
mkdir /data/lvs-manager/MonitorWeb/backend/lvspublish
wget https://github.com/lxcong/lvs-manager/archive/master.zip

#解压
unzip master.zip

#安装Python依赖
pip install -r requirements.txt

#安装salt-master
rpm --import https://repo.saltstack.com/yum/redhat/6/x86_64/latest/SALTSTACK-GPG-KEY.pub
yum install salt-master

#启动salt-master
/etc/init.d/salt-master


#install MongoDB v2.6.12
cat > /etc/yum.repos.d/mongodb.repo <<EOF
[mongodb-org-2.6]
name=MongoDB 2.6 Repository
baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/
gpgcheck=0
enabled=1
EOF

yum install -y mongodb-org

#启动mongodb
/etc/init.d/mongod start








