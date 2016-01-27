SWAP Opsworks recipe
========================

Chef cookbook to create a swap in your ec2 instance

Recipes
------------------

`swap::create` create a swap with specific size

Databag
-------------------
Be sure to specify swap size in mb:
```json
{
  "swap_size": "8192"
}
```

License and Author
===============================

Author:: Antonio Grass

This project uses MIT-LICENSE.
