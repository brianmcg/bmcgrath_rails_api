# config valid for current version and patch releases of Capistrano
lock "~> 3.18.1"

set :application, "bmcgrath_rails_api"
set :repo_url, "git@github.com:brianmcg/bmcgrath_rails_api.git"

# set :rbenv_prefix, "/usr/bin/rbenv exec" # Cf issue: https://github.com/capistrano/rbenv/issues/96
set :rbenv_prefix, "/home/azureuser/.rbenv/bin/rbenv exec" # Cf issue: https://github.com/capistrano/rbenv/issues/96
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", ".bundle", "public/system", "public/uploads"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch, "main"

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/azureuser/#{fetch :application}"

# Default value for :linked_files is []
append :linked_files, "config/master.key"

# Upload master.key
namespace :deploy do
  namespace :check do
    before :linked_files, :set_master_key do
      on roles(:app) do
        unless test("[ -f #{shared_path}/config/master.key ]")
          upload! "config/master.key", "#{shared_path}/config/master.key"
        end
      end
    end
  end
end

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "vendor", "storage"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV["USER"]
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
