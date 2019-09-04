#!/bin/bash
#
######################################################################
#
# [SCRIPT NAME]
#  zabbix-oci-dbaas.sh
#
# [Outline]
#  Deploy the settings of zabbix-oci-dbaas.
#
######################################################################
# Version   Author                 Update date      changes
#---------------------------------------------------------------------
# 001       yu araki               2019/07/18       Create New
######################################################################
######################################################################
# Variable definition
######################################################################
## Working variable
SOURCE_DIR=$(dirname $0)
ZABBIX_DIR=/etc/zabbix

## ORACLE User related
ORACLE_USER=${1:-monitor}
ORACLE_PASS=${2:-xxxxxxx}

######################################################################
# Main body
######################################################################
#---------------------------------------------------------------------
# Configuration file placement
#---------------------------------------------------------------------
mkdir -p ${ZABBIX_DIR}/scripts/agentd/zabbix-oci-dbaas
cp -rpv  ${SOURCE_DIR}/zabbix-oci-dbaas/sql                 ${ZABBIX_DIR}/scripts/agentd/zabbix-oci-dbaas/
cp -rpv  ${SOURCE_DIR}/zabbix-oci-dbaas/zabbix-oci-dbaas.conf.org ${ZABBIX_DIR}/scripts/agentd/zabbix-oci-dbaas/zabbix-oci-dbaas.conf
cp -rpv  ${SOURCE_DIR}/zabbix-oci-dbaas/zabbix-oci-dbaas.sh           ${ZABBIX_DIR}/scripts/agentd/zabbix-oci-dbaas/
cp -rpv  ${SOURCE_DIR}/zabbix-oci-dbaas/zabbix_agentd.conf  ${ZABBIX_DIR}/zabbix_agentd.d/zabbix-oci-dbaas.conf

regex_array[0]="s|ORACLE_USER=.*|ORACLE_USER=\"${ORACLE_USER}\"|g"
regex_array[1]="s|ORACLE_PASS=.*|ORACLE_PASS=\"${ORACLE_PASS}\"|g"
for index in ${!regex_array[*]}; do
    sed -i "${regex_array[${index}]}" ${ZABBIX_DIR}/scripts/agentd/zabbix-oci-dbaas/zabbix-oci-dbaas.conf
done
