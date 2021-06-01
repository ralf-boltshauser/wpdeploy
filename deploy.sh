#!/bin/bash

### PAKETIERE LOKAL

# db dump via mysql docker instanz
id=6229f1fee664 # 68cec3feb83a
docker exec -ti 6229f1fee664 /usr/bin/mysqldump -u root -psomewordpress -d wordpress > dump.sql

tar -C ./wordpress/wp-content/ -cvzf uploads.tar.gz ./uploads

tar -C ./wordpress/wp-content/ -cvzf themes.tar.gz ./themes

tar .C ./wordpress/wp-content -cvzf plugins.tar.gz ./plugins

docker exec -ti wpdeploy_wordpress_1 cat wp-config.php > wp-config.localdev.php

ssh kx84u_bbw@5ia18a.root-systems.ch 'cd sites/5ia18a.root-systems.ch/boltshauser ; git clone https://github.com/ralf-boltshauser/wpdeploy.git ; mkdir themes ; mkdir plugins ; mkdir uploads ; tar -xf ./wpdeploy/themes.tar.gz -C ./ ; tar -xf ./wpdeploy/plugins.tar.gz -C ./ ; tar -xf ./wpdeploy/uploads.tar.gz -C ./ ; cp ./wpdeploy/dump.sql ./dump.sql'

