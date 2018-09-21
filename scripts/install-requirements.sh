#!/usr/bin/env bash
set -euo pipefail

echo "Installing requirements"

apt-get update
apt-get install -y openjdk-8-jdk

# TODO: add export in /etc/profile?
echo "JAVA_HOME=\"$(readlink -f /usr/bin/java | sed 's:/jre/bin/java::')\"" >> /etc/environment

# TODO: add hostname `hostname -I` to /etc/rc.local
