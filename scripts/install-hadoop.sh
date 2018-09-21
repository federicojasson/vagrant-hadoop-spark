#!/usr/bin/env bash
set -euo pipefail

version="2.8.4"

echo "Installing Hadoop ${version}"

wget -q -O hadoop.tar.gz "http://apache.mirrors.tds.net/hadoop/common/hadoop-${version}/hadoop-${version}.tar.gz"
tar -xzf hadoop.tar.gz -C /opt
mv "/opt/hadoop-${version}" /opt/hadoop
rm hadoop.tar.gz
# TODO: add export in /etc/profile?
sed -i 's|^PATH="\(.*\)"$|PATH="\1:/opt/hadoop/bin"|' /etc/environment

rm -f /opt/hadoop/etc/hadoop/core-site.xml && mv /tmp/core-site.xml /opt/hadoop/etc/hadoop/core-site.xml
rm -f /opt/hadoop/etc/hadoop/hdfs-site.xml && mv /tmp/hdfs-site.xml /opt/hadoop/etc/hadoop/hdfs-site.xml
rm -f /opt/hadoop/etc/hadoop/mapred-site.xml && mv /tmp/mapred-site.xml /opt/hadoop/etc/hadoop/mapred-site.xml
rm -f /opt/hadoop/etc/hadoop/yarn-site.xml && mv /tmp/yarn-site.xml /opt/hadoop/etc/hadoop/yarn-site.xml

useradd -m -s /bin/bash -G sudo hadoop
chown -R hadoop:hadoop /opt/hadoop
mkdir -p /home/hadoop/.ssh
ssh-keygen -C hadoop -t rsa -P '' -f /home/hadoop/.ssh/id_rsa
ssh-keyscan localhost,0.0.0.0 > /home/hadoop/.ssh/known_hosts
cat /home/hadoop/.ssh/id_rsa.pub >> /home/hadoop/.ssh/authorized_keys
chmod 0600 /home/hadoop/.ssh/authorized_keys
chown -R hadoop:hadoop /home/hadoop/.ssh

sudo -u hadoop /opt/hadoop/bin/hdfs namenode -format
sudo -u hadoop /opt/hadoop/sbin/start-dfs.sh
sudo -u hadoop /opt/hadoop/sbin/start-yarn.sh

sudo -u hadoop /opt/hadoop/bin/hdfs dfs -mkdir /user
sudo -u hadoop /opt/hadoop/bin/hdfs dfs -mkdir /user/hadoop
