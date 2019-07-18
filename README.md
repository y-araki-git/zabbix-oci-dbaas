# ZabbixでOCI Dbaas監視 - エージェント設定

### 設定手順については以下のリンクを参照

### 監視追加方法については以下のリンクを参照

### このリポジトリの構成

monitoring-oci-dbaas  
├deploy_zabbix.sh (zabbix agentで実行するDbaas監視設定スクリプト)  
├README.md  
├template_oci_dbaas.xml (zabbixコンソールでインポートするテンプレート)    
└zabbix-oci-dbaas (/etc/zabbix/scripts/agentd/zabbix-oci-dbaas/配下に配置されるファイルを格納)    
&emsp;├zabbix_agentd.conf (UserParameterの設定)  
&emsp;├zabbix-oci-dbaas.conf.org (OracleDB監視用ユーザ)  
&emsp;├zabbix-oci-dbaas.oraenv.org (zabbix-oci-dbaas実行時 環境変数設定ファイル)  
&emsp;├zabbix-oci-dbaas.sh (zabbix-oci-dbaasの設定を配置するスクリプト)  
&emsp;└sql(監視アイテム取得sqlを格納)  
&emsp;&emsp;├xxx.sql  
&emsp;&emsp;…
