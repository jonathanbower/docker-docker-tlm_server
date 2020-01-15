#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

# Install necessary packages
apt-get update
install_clean wget tzdata

wget http://www.tweaksoftware.com/static/downloads/tlm_server-Linux-x86-64-2.6.1.tar.gz

mkdir /usr/local/tweak
tar xzvf tlm_server-Linux-x86-64-2.6.1.tar.gz --strip 1 -C /usr/local/tweak
cd /usr/local/tweak/scripts
# Set install path to /usr/local/tweak
sed -i '/^TLM_INSTALL/s/=.*$/=\/usr\/local\/tweak/' start_tlmserver_init.sh
# Enable log to /var/log/tlm_server.log
sed -i '/^ARGS=/s/=.*$/=\"\ -f\ \$TLM_INSTALL\/etc\/license.gto\ -log\ \/var\/log\/tlm_server.log\"/' start_tlmserver_init.sh
./install_tlmserver

# Clean up
apt-get clean -y
rm -rf /var/lib/apt/lists/* /var/cache/* /var/tmp/* /tmp/*
