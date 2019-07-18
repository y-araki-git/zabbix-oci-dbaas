# ZabbixでOCI Dbaas監視 - エージェント設定

### 設定手順については以下のリンクを参照
https://qiita.com/y-araki-qiita/items/f25e02182c7f279c0199
### 監視追加方法については以下のリンクを参照

### このリポジトリの構成

zabbix-oci-dbaas  
├deploy_zabbix-oci-dbaas.sh (zabbix agentで実行するDbaas監視設定スクリプト)  
├README.md  
├template_oci_dbaas.xml (zabbixコンソールでインポートするテンプレート)    
└zabbix-oci-dbaas (/etc/zabbix/scripts/agentd/zabbix-oci-dbaas/配下に配置されるファイルを格納)    
&emsp;├zabbix_agentd.conf (UserParameterの設定)  
&emsp;├zabbix-oci-dbaas.conf.org (OracleDB監視用ユーザ記載)  
&emsp;├zabbix-oci-dbaas.oraenv.org (環境変数設定ファイル)  
&emsp;├zabbix-oci-dbaas.sh (監視取得スクリプト)  
&emsp;└sql(監視アイテム取得sqlを格納)  
&emsp;&emsp;├xxx.sql  
&emsp;&emsp;…
