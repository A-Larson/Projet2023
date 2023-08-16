@echo off

set MYSQL_USER=fdtcpe
set MYSQL_PASSWORD=fdtcpe!23
set BACKUP_DIR=C:\Users\admin_nod\Sauvegarde BD fdt

:: Obtenir la date et l'heure actuelles au format "YYYYMMDD_HHMMSS"
for /f "tokens=2-4 delims=/: " %%a in ('echo %DATE%') do ( 
    set "date=%%c%%a%%b"
)

for /f "tokens=1-2 delims=:." %%a in ("%time%") do (
    set "time=%%a%%b"
)

:: Créer le nom du fichier de sauvegarde avec la date et l'heure
set "backup_cpe=%BACKUP_DIR%\fdt_cpe_%date%T%time%.sql"
set "backup_silae=%BACKUP_DIR%\fdt_silae_%date%T%time%.sql"

cd C:\xampp\mysql\bin

mysqldump -u %MYSQL_USER% -p%MYSQL_PASSWORD% fdt > "%backup_cpe%"
mysqldump -u %MYSQL_USER% -p%MYSQL_PASSWORD% silae > "%backup_silae%"