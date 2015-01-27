############################################################
# All variables that are independent per env goes here
############################################################

role :app, %w{capistrano3-demo-deploy-one.local capistrano3-demo-deploy-two.local}
role :web, %w{}
role :db,  %w{}

set :webserver_service,                 "apache2"
set :webserver_user,                    "vagrant"
set :webserver_group,                   "vagrant"
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