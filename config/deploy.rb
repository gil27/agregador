require "bundler/capistrano"
require "rvm/capistrano"

set :application, "gilgomes.com.br"
set :repository,  "https://github.com/gil27/agregador.git"
set :scm, :git

role :web, "gilgomes.com.br"
role :app, "gilgomes.com.br"
role :db,  "gilgomes.com.br", :primary => true

set :deploy_to, "/home/gil/agregador"
set :user, "gil"
set :use_sudo, false
set :keep_releases, 5

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "cd #{release_path} && touch tmp/restart.txt"
  end

  task :bundleinstall, :roles => :app do
    run "cd #{release_path}; bundle exec bundle install"
  end

  task :database, :roles => :app do
    run "cp #{deploy_to}/shared/database.yml #{release_path}/config/"
    run "cd #{release_path}; bundle exec rake db:migrate RAILS_ENV=production"
  end

  task :secrets, :roles => :app do
    run "cp #{deploy_to}/shared/secrets.yml #{release_path}/config/initializers/"
  end

  task :omniauth, :roles => :app do
    run "cp #{deploy_to}/shared/omniauth.rb #{release_path}/config/initializers/"
  end

  task :rvmrc, :roles => :app do
    run "rm -f #{release_path}/.rvmrc"
  end
end

$:.unshift(File.expand_path('./lib', ENV['rvm_path']))

set :rvm_type, :user
set :rails_env, "production"
set :rvm_ruby_string, 'ruby-2.1.3'

ssh_options[:forward_agent] = true
default_run_options[:pty] = true

#after :deploy, 'deploy:jekyll'
after 'deploy:update_code', 'deploy:bundleinstall',  "deploy:database", "deploy:omniauth", "deploy:secrets", "deploy:restart"
