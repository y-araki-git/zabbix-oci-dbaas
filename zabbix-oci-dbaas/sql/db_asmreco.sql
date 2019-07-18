SET pagesize 0
SET heading OFF
SET feedback OFF
SET verify OFF
SELECT
ROUND(((total_mb-free_mb)/total_mb*100)) "USED(%)"
FROM v$asm_diskgroup
WHERE NAME in ('RECO');
QUIT;