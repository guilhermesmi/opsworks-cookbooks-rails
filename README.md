opsworks-cookbooks for Ruby On Rails Custom Stack
===================================================

**This repo contains cookbooks used by AWS OpsWorks for Chef versions 11.10**

To get started with AWS OpsWorks cookbooks for all versions of Chef see the [cookbook documentation](https://docs.aws.amazon.com/opsworks/latest/userguide/workingcookbook.html).

Rails Recipes
------------------
This recipes are based on Ruby on Rails app running with nginx and unicorn

* `rails::configure` install db client, set folder permissions
* `rails::mongoid_config` create mongoid.yml config file
* `rails::database_config` create database.yml config file
* `rails::deploy` clone app repository, bundle install and deploy app
* `rails::restart` restart unicorn

**Databag**
Be sure to specify deploy user and deploy path, I recommend use /mnt/srv/www due this [issue](https://github.com/aws/opsworks-cookbooks/issues/213):
```json
{
  "deploy": {
    "user": "ubuntu",
    "deploy_to": "/mnt/srv/www/app-name"
  }
}
```

For the database config using `rails::database_config` recipe you must specify this data
```json
{
  "rails_env": "production",
  "database": {
    "adapter": "mysql",
    "encoding": "utf8",
    "database": "database_name",
    "host": "database_host",
    "username": "database_username",
    "password: "database_password",
    "pool": 64
  }
}
```

For the mongoid config using `rails::mongoid_config` recipe you must specify this data
```json
{
  "mongoid" : (json representation of mongoid.yml)
}
```

ELK (logstash, elasticsearch and kibana) Recipes
------------------
For the moment there are only recipes to configure filebeat to send logs to remote logstash server

* `filebeat::default` install and configure filebeat

**Databag**
Be sure to specify:
```json
{
  "filebeat": {
    "host": "[ip/domain:port]",
    "path": "/mnt/srv/www/app/log/production.log",
    "cert": "/etc/ssl/certs/filebeat.crt",
    "cert_content": ["-----BEGIN CERTIFICATE-----",
                      "MIIEczCCA1ugAwIBAgIBADANBgkqhkiG9w0BAQQFAD..AkGA1UEBhMCR0Ix",
                      "BMAV7Gzdc4VspS6ljrAhbiiawdBiQlQmsBeFz9JkF4..b3l8BoGN+qMa56Y",
                      "It8una2gY4l2O//on88r5IWJlm1L0oA8e4fR2yrBHX..adsGeFKkyNrwGi/",
                      "7vQMfXdGsRrXNGRGnX+vWDZ3/zWI0joDtCkNnqEpVn..HoX",
                      "-----END CERTIFICATE-----"]
  }
}
```

AWS CLI Recipes
------------------
For the moment there are recipes only for elb register/deregister and classiclink register/deregister

* `awscli::default` install aws cli

* `awscli::register_elb` register instance to elb

* `awscli::deregister_elb` deregister instance to elb

* `awscli::register_classiclink` register instance to classiclink VPN

* `awscli::deregister_classiclink` deregister instance to classiclink VPN

**Databag**
Be sure to specify aws credential and elb name in case of elb register or vpc and groups ids in case of ClassicLink register:
```json
{
"aws": {
     "AWS_ACCESS_KEY_ID": "AWS KEY ID",
      "AWS_SECRET_ACCESS_KEY": "AWS ACCESS KEY",
      "elb": {
        "load_balancer_name": "LOAD BALANCER NAME"
      },
      "classic_link": {
        "vpc_id": "VPC ID",
         "groups": "SG-ID1 SG-ID2"
      }
    }
}
```




See also <https://aws.amazon.com/opsworks/>

LICENSE: Unless otherwise stated, cookbooks/recipes originated by Amazon Web Services are licensed
under the [Apache 2.0 license](http://aws.amazon.com/apache2.0/). See the LICENSE file. Some files
are just imported and authored by others. Their license will of course apply.
