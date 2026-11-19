 tree /F /A > final.txt 

Postgresql

ant
ant dans aigle dor


wildFly
cd /d "D:\don't touch\wildfly-10.1.0.Final\bin"
standalone.bat



Arret postgres
& "D:\don't touch\PostgreSQL\18\bin\pg_ctl.exe" -D "D:\don't touch\PostgreSQL\18\data" stop

redenarre postgres
& "D:\don't touch\PostgreSQL\18\bin\pg_ctl.exe" -D "D:\don't touch\PostgreSQL\18\data" -l "D:\don't touch\PostgreSQL\18\data\demarrage.log" start


arreter wildfly
jboss-cli.bat --connect command=:shutdown
Stop-Process -Id (Get-NetTCPConnection -LocalPort 8080 -State Listen | Select-Object -First 1).OwningProcess



localhost:8080/socobis/pages/module.jsp?but=mouvement/mouvementemploye-liste.jsp