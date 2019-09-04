#!/bin/bash
#
######################################################################
#
# [SCRIPT NAME]
#  zabbix-oci-dbaas.sh
#
# [Outline]
#  Execute Userparameter described in zabbix_agentd.conf.
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
rcode=0
PATH=/usr/local/bin:${PATH}
APP_NAME=$(basename $0)
APP_DIR=$(dirname $0)
APP_VER="1.0.0"


######################################################################
# Function definition
######################################################################
usage() {
    echo "Usage: ${APP_NAME%.*} [Options]"
    echo ""
    echo "Options:"
    echo "  -h            Displays this help message."
    echo "  -a            Query arguments."
    echo "  -s ARG(str)   Query to Oracle."
    echo "  -o ARG(str)   Set SID to make the query."
    echo "  -j            Jsonify output."
    echo "  -v            Show the script version."
    echo ""
    echo "Please send any bug reports to a2105717@gmail.com"
    exit 1
}

version() {
    echo "${APP_NAME%.*} ${APP_VER}"
    exit 1
}

######################################################################
# Main body
######################################################################
#---------------------------------------------------------------------
# Load Oracle Environment.
#---------------------------------------------------------------------

[ -x ${APP_DIR}/${APP_NAME%.*}.conf ] || . ${APP_DIR}/${APP_NAME%.*}.conf


#---------------------------------------------------------------------
# Main Processing.
#---------------------------------------------------------------------
while getopts "s::a:o:hvj:" OPTION; do
    case ${OPTION} in
	h)
	    usage
	    ;;
	s)
	    SQL="${APP_DIR}/sql/${OPTARG}"
	    ;;
	o)
	    ORACLE_SID=${OPTARG}
	    ;;
        j)
            JSON=1
	    JSON_ATTR=${OPTARG}
            ;;
	a)
	    SQL_ARGS=${OPTARG}
	    ;;
	v)
	    version
	    ;;
         \?)
            exit 1
            ;;
    esac
done

if [[ -f ${APP_DIR}/zabbix-oci-dbaas.oraenv ]]; then
    . ${APP_DIR}/zabbix-oci-dbaas.oraenv
else
    ORAENV_ASK=NO
    . /usr/local/bin/oraenv > /dev/null
fi
if [[ -f "${SQL%.sql}.sql" ]]; then
    rval=`sqlplus -s ${ORACLE_USER}/${ORACLE_PASS} @${SQL} "${SQL_ARGS}"`
    rcode="${?}"
    if [[ ${JSON} -eq 1 ]]; then
       set -A rval ${rval}
       echo '{'
       echo '   "data":['
       count=1
       for i in ${rval[@]};do
          output='{ "'{#${JSON_ATTR}}'":"'${i}'" }'
          if (( ${count} < ${#rval[*]} )); then
             output="${output},"
          fi
          echo "      ${output}"
          let "count=count+1"
       done
       echo '   ]'
       echo '}'
    else
       echo ${rval:-0}
    fi
else
    echo "ZBX_NOTSUPPORTED"
    rcode="1"
fi

#---------------------------------------------------------------------
# End Proccess.
#---------------------------------------------------------------------
exit ${rcode}
