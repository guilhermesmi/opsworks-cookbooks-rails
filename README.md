opsworks-cookbooks for Ruby On Rails Custom Stack
===================================================

**This repo contains cookbooks used by AWS OpsWorks for Chef versions 11.10**

To get started with AWS OpsWorks cookbooks for all versions of Chef see the [cookbook documentation](https://docs.aws.amazon.com/opsworks/latest/userguide/workingcookbook.html).

Rails Recipes
------------------
This recipes are based on Ruby on Rails app running with nginx and unicorn

`rails::configure` install db client, set folder permissions
`rails::mongoid_config` create mongoid.yml config file
`rails::database_config` create database.yml config file
`rails::deploy` clone app repository, bundle install and deploy app
`rails::restart` restart unicorn

Databag
-------------------
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



See also <https://aws.amazon.com/opsworks/>

LICENSE: Unless otherwise stated, cookbooks/recipes originated by Amazon Web Services are licensed
under the [Apache 2.0 license](http://aws.amazon.com/apache2.0/). See the LICENSE file. Some files
are just imported and authored by others. Their license will of course apply.
