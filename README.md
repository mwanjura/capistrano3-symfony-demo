Usage:
=================

1. Install vagrant: https://www.vagrantup.com/

2. $ `vagrant up`

3. $ `vagrant ssh capistrano3demo`

4. $ `cd /var/www/`

5. $ `composer install`

6. $ `exit`

7. Open http://capistrano3-demo.local/. You should see the symfony acme application.

8. Open http://capistrano3-demo-deployed.local/. You should see a "Not Found" message.

9. $ `gem install bundler`

10. $ `bundle install`

11. $ `bundle exec cap -T`

12. $ `bundle exec cap development deploy`

13. $ `bundle exec cap production deploy`