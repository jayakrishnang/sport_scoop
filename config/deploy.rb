# frozen_string_literal: true

# config valid for current version and patch releases of Capistrano
lock '~> 3.11.0'

set :application, 'sport_scoop'
set :repo_url, 'git@github.com:jayakrishnang/sport_scoop.git'
set :pty, false
set :deploy_via, :remote_cache
set :deploy_to, '/var/deploy/sport_scoop'
set :user, 'ubuntu'
set :use_sudo, true

# append :linked_files, 'config/credentials.yml.enc'
# append :linked_files, 'config/master.key'
# append :linked_files, 'config/database.yml'
# append :linked_files, '.env'

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
# set :linked_dirs, %w[tmp/pids]  

namespace :deploy do
  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  after  :finishing,    :cleanup
  after  :finishing,    :restart
end
