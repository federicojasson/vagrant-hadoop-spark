#!/usr/bin/env bash
set -euo pipefail

echo "Configuring Hadoop"

su - hadoop
source /etc/environment

ssh-keygen -t rsa -P '' -f /home/hadoop/.ssh/id_rsa
ssh-keyscan localhost,0.0.0.0 > /home/hadoop/.ssh/known_hosts
cat /home/hadoop/.ssh/id_rsa.pub >> /home/hadoop/.ssh/authorized_keys
chmod 0600 /home/hadoop/.ssh/authorized_keys

hdfs namenode -format
/opt/hadoop/sbin/start-dfs.sh
/opt/hadoop/sbin/start-yarn.sh

hdfs dfs -mkdir /user
hdfs dfs -mkdir /user/hadoop
