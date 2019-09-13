SET pagesize 0
SET heading OFF
SET feedback OFF
SET verify OFF
select round((min(a.BYTES)/(1024*1024) - sum(b.BYTES)/(1024*1024))/ (min(a.BYTES)/1024/1024)*100,2)
from dba_data_files a, dba_free_space b
where a.FILE_ID = b.FILE_ID and a.TABLESPACE_NAME = 'SYSAUX';
QUIT;