Filebeat Opsworks recipe
========================

Chef cookbook to install and configure filebeat service to send logs to logstash remote server

Recipes
------------------

`filebeat::default` install filebeat and restart service

Databag
-------------------
Be sure to specify: 
```json
{ 
  "filebeat": {
    "host": "[ip/domain:port]",
    "path": "/mnt/srv/www/app/log/production.log",
    "cert": "/etc/ssl/certs/filebeat.crt"
  }
}
```

License and Author
===============================

Author:: Antonio Grass
