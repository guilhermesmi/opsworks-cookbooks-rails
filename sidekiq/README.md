Sidekiq Opsworks recipe
========================

Chef cookbook to start/stop and shutdown sidekiq

Recipes
------------------

`sidekiq:start` start sidekiq process
`sidekiq:stop` stop receiving sidekiq process wait 60 seconds and then kill the process
`sidekiq:shutdown` stop receiving sidekiq process without killing it

When deploy the app in Opsworks is recommended to stop sidekiq first, then deploy and at the end of the deploy shutdow


License and Author
===============================

Author:: Antonio Grass

This project uses MIT-LICENSE.
