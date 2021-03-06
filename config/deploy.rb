# config valid only for current version of Capistrano
lock "3.8.2"

set :application, 'fog'
set :repo_url, 'https://github.com/kapmahc/fog.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"
set :deploy_to, -> {"/var/www/#{fetch :hostname}"}

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, 'config/database.yml', '.rbenv-vars',
       'public/robots.txt', 'public/favicon.ico',
       'vendor/assets/images/admin/logo.png', 'vendor/assets/images/logo/spree_50.png',
       'vendor/assets/images/noimage/large.png', 'vendor/assets/images/noimage/mini.png', 'vendor/assets/images/noimage/product.png', 'vendor/assets/images/noimage/small.png'

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system',
       'public/ckeditor_assets', 'public/spree'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 7

set :rbenv_type, :user
set :rbenv_ruby, File.read('.ruby-version').strip

set :nginx_use_ssl, true
set :nginx_config_name, -> { fetch :hostname }
set :nginx_server_name, -> { fetch :hostname }

