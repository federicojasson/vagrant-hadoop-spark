#!/usr/bin/env bash
set -euo pipefail

version="2.8.4"

echo "Installing Hadoop ${version}"

wget -q -O hadoop.tar.gz "http://apache.mirrors.tds.net/hadoop/common/hadoop-${version}/hadoop-${version}.tar.gz"
tar -xzf hadoop.tar.gz -C /opt
mv "/opt/hadoop-${version}" /opt/hadoop
rm hadoop.tar.gz

useradd -m -s /bin/bash -G sudo hadoop
chown -R hadoop:hadoop /opt/hadoop
sed -i 's|^PATH="\(.*\)"$|PATH="\1:/opt/hadoop/bin"|' /etc/environment

rm -f /opt/hadoop/etc/hadoop/core-site.xml
rm -f /opt/hadoop/etc/hadoop/hdfs-site.xml
rm -f /opt/hadoop/etc/hadoop/mapred-site.xml
rm -f /opt/hadoop/etc/hadoop/yarn-site.xml
