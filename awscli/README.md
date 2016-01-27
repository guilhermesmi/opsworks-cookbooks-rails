AWS Cli Opsworks recipe
========================

Chef cookbook to use aws cli commands

Recipes
------------------

`awscli::install` install aws cli

`awscli::register_elb` register instance to elb

`awscli::deregister_elb` deregister instance to elb

`awscli::register_classiclink` register instance to classiclink VPN

`awscli::deregister_classiclink` deregister instance to classiclink VPN

Databag
-------------------
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

License and Author
===============================

Author:: Antonio Grass

This project uses MIT-LICENSE.
