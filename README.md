# debian-chef
Chef Warmup

## Warmup task 1 - Install vim and bash-completion
Run `sudo chef-solo -c solo.rb -j system.json` to run warmup task 1.

## Warmup task 2 - Install and configure a basic Nginx web server
Run `sudo chef-solo -c solo.rb -j web.json` to run warmup task 2.

You can edit the template in cookbooks/webservers/templates/default/nginx.conf.erb to change
the website configuration file. To enable the changes, run `chef-solo -c solo.rb -j web.json` to
have the nginx server reload the configuration file.
