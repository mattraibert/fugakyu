default_run_options[:pty] = true

set :application, "fugakyu"
set :repository,  "http://mattraibert.ath.cx/svn/repos/fugakyu/trunk"

set :scm, :subversion
set :deploy_to, "/var/www/apps/#{application}"
set :user, "mattraibert"
set :admin_runner, "mattraibert"

server "mattraibert.ath.cx", :app, :web, :db, :primary => true

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do
  end
  task :stop do
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
 end
