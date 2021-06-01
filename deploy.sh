#!/bin/bash

### PAKETIERE LOKAL

# db dump via mysql docker instanz
id=68cec3feb83a # 68cec3feb83a
docker exec -ti $id /usr/bin/mysqldump -u ralf -p1234 -d wordpress > dump.sql

tar -C ./wordpress/wp-content/ -cvzf uploads.tar.gz ./uploads

tar -C ./wordpress/wp-content/ -cvzf themes.tar.gz ./themes

tar .C ./wordpress/wp-content -cvzf plugins.tar.gz ./plugins

docker exec -ti wpdeploy_wordpress_1 cat wp-config.php > wp-config.localdev.php

scp themes.tar.gz kx84u_bbw@5ia18a.root-systems.ch:~/sites/5ia18a.root-systems.ch/boltshauser/
scp uploads.tar.gz kx84u_bbw@5ia18a.root-systems.ch:~/sites/5ia18a.root-systems.ch/boltshauser/
scp plugins.tar.gz kx84u_bbw@5ia18a.root-systems.ch:~/sites/5ia18a.root-systems.ch/boltshauser/
scp dump.sql kx84u_bbw@5ia18a.root-systems.ch:~/sites/5ia18a.root-systems.ch/boltshauser/ 

ssh kx84u_bbw@5ia18a.root-systems.ch 'tar -xvf ~/sites/5ia18a.root-systems.ch/boltshauser/themes.tar.gz'
