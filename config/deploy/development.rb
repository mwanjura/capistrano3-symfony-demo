############################################################
# All variables that are independent per env goes here
############################################################

role :app, %w{capistrano3-demo-deployed.local}
role :web, %w{}
role :db,  %w{}

set :servers_to_restart, ['capistrano3-demo-deployed.local']

set :webserver_service,                 "httpd"
set :webserver_user,                    "apache"
set :webserver_group,                   "apache"
set :rails_env,                         "development"
set :deploy_to,                         "/var/www/"
set :user,                              "vagrant"
set :domain,                            "capistrano3-demo-deployed.local"
set :parameters_file,                   "parameters_development.yml"
set :symfony_env_prod,                  "dev"
# Depending on this value, the remote environment will be activated
set :symfony_target_env,                "dev"
set :symfony_console_flags,             "--env=dev --no-debug"
set :symfony_taget_env_frontcontroller, "app_dev.php"
set :scm_command,                       "/usr/bin/git"
set :composer_options,                  "--verbose --prefer-dist --optimize-autoloader"

SSHKit.config.command_map[:composer] = "/var/www/shared/composer.phar"

set :user, "vagrant"
set :ssh_options, {
    keys: ["~/.vagrant.d/insecure_private_key"],
    forward_agent: false,
    port: 22,
    auth_methods: %w(publickey),
    user: "vagrant",
}

set :default_env, {
    'https_proxy' => "",
    'http_proxy' => "",
}