lock '3.1.0'
set :application, 'MetalDemo'
set :use_sudo, true
set :repo_url, 'git@github.com:Shruti2791/MetalDemo.git'

set :deploy_to, '/home/deploy/MetalDemo'
set :deploy_via, :remote_cache

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

SSHKit.config.command_map[:rake]  = "bundle exec rake"
SSHKit.config.command_map[:rails] = "bundle exec rails"

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  # task :updated do
  #   on roles(:app), in: :sequence, wait: 5 do
  #     execute :touch, release_path.join('tmp/restart.txt')
  #   end
  # end

  after :finishing, 'deploy:cleanup'
  after :publishing, 'deploy:restart'
end