# config valid only for Capistrano 3.3.5
lock '3.3.5'

set :application, 'capistrano3-demo'
set :repo_url, 'https://github.com/mwanjura/capistrano3-symfony-demo.git'

# Default branch is :master
set :branch, ENV['branch'] || (ask :branch, proc { `echo master`.chomp }.call)

set :deploy_to,                 fetch(:deploy_to)
set :format,                    :pretty
set :log_level,                 :debug
set :pty,                       true
set :keep_releases,             3
set :permission_method,         :chmod
set :use_set_permissions,       false

set :symfony_env,               fetch(:symfony_target_env)
set :app_path,                  "app"
set :web_path,                  "web"
set :log_path,                  fetch(:app_path) + "/logs"
set :cache_path,                fetch(:app_path) + "/cache"
set :app_config_path,           fetch(:app_path) + "/config"
set :controllers_to_clear,      ["app_*.php"]

set :linked_files,              []
set :linked_dirs,               [fetch(:log_path), "vendor"]

set :symfony_console_flags,     "--no-debug"
set :assets_install_path,       fetch(:web_path)
set :assets_install_flags,      '--symlink'
set :assetic_dump_flags,        ''
set :composer_install_flags,    '--no-interaction --prefer-dist --optimize-autoloader'
set :symfony_console_flags,     fetch(:symfony_console_flags)

fetch(:default_env).merge!(symfony_env: fetch(:symfony_env))

namespace :custom do

    desc 'Restart webserver'
    task :restart_webserver do
        fetch(:servers_to_restart).each do |server|
            on server do
                execute "sudo service #{fetch(:webserver_service)} restart"
            end
        end
    end

    task :set_symfony_env do
        on roles(:app) do
            execute "cd #{fetch(:release_path)}; if [ 'web/#{fetch(:symfony_taget_env_frontcontroller)}' != 'web/app.php' ]; then cp -rf web/#{fetch(:symfony_taget_env_frontcontroller)} web/app.php; fi"
        end
    end

end

namespace :deploy do
  before :started, 'composer:install_executable'
  before :updated, 'custom:set_symfony_env'
  before :finishing, 'symfony:assetic:dump'
  after :log_revision, 'custom:restart_webserver'

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end