# 参考
# https://morizyun.github.io/ruby/rails-capistrano3-deploy-rbenv-puma.html
lock "~> 3.11.0"

set :repo_url,        'https://github.com/Cam1no/mars.git' # 設定箇所
set :application,     'mars' # 設定箇所
set :user,            'mars' # 設定箇所
set :puma_threads,    [4, 16]
set :puma_workers,    0
set :pty,             true
set :use_sudo,        false
set :stage,           :production
set :deploy_via,      :remote_cache
set :deploy_to,       '/var/www/rails/mars' # 設定箇所
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.access.log"
set :puma_error_log,  "#{release_path}/log/puma.error.log"
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :rbenv_type, :deploy
set :rbenv_custom_path, '/usr/local/rbenv'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all
set :rbenv_ruby, File.read('.ruby-version').strip
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w[rake gem bundle ruby rails]
set :branch, 'master'
set :linked_dirs, fetch(:linked_dirs, []).push(
  'log',
  'tmp/pids',
  'tmp/cache',
  'tmp/sockets',
  'vendor/bundle',
  'public/system',
  'public/uploads'
)
set :linked_files, fetch(:linked_files, []).push(
  'config/database.yml',
  'config/secrets.yml',
  '.env',
  'config/master.key'
)
set :whenever_identifier, -> { "#{fetch(:application)}_#{fetch(:stage)}" }

set :yarn_flags, "--prefer-offline --production --no-progress"
set :yarn_roles, :web
set :yarn_env_variables, fetch(:yarn_env_variables, {})

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end
  before :start, :make_dirs
end

namespace :deploy do
  desc 'Make sure local git is in sync with remote.'
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
      end
    end
  end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
    end
  end

  desc 'Create Database'
  task :db_create do
    on roles(:db) do
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:create'
      end
      end
    end
  end

  desc 'migrate database'
  task :db_migrate do
    on roles(:db) do
      with rails_env: fetch(:rails_env) do
        within release_path do
          execute :bundle, :exec, :rake, 'db:migrate'
        end
      end
    end
  end

  before :starting,     :check_revision
  after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
end

namespace :yarn do
  desc 'Build Javascript webpack'
  task :start do
    on roles(:app) do
      execute("/bin/bash -l -c 'cd #{release_path} && yarn'")
    end
  end
end
before 'deploy:assets:precompile', 'yarn:start'
