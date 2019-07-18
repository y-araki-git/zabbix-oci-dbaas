# ZabbixでOCI Dbaas監視 - エージェント設定

### 設定手順については以下のリンクを参照

### 監視追加方法については以下のリンクを参照

### このリポジトリの構成

monitoring-oci-dbaas  
├deploy_zabbix.sh (zabbix agentで実行するDbaas監視設定スクリプト)  
├README.md  
├template_oci_dbaas.xml (zabbixコンソールでインポートするテンプレート)  
└zabbix-oci-dbaas (/etc/zabbix/scripts/agentd/zabbix-oci-dbaas/配下に配置されるファイルを格納)  
    ├zabbix_agentd.conf (UserParameterの設定)  
    ├zabbix-oci-dbaas.conf.org (OracleDB監視用ユーザ)  
    ├zabbix-oci-dbaas.oraenv.org (zabbix-oci-dbaas実行時 環境変数設定ファイル)  
    ├zabbix-oci-dbaas.sh (zabbix-oci-dbaasの設定を配置するスクリプト)  
    └sql(監視アイテム取得sqlを格納)  
        ├xxx.sql  
        …