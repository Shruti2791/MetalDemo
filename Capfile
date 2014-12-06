require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/bundler'
require 'capistrano/rails/migrations'

# If you are using rvm add these lines:
# require 'capistrano/rvm'
# set :rvm_type, :user
# set :rvm_ruby_version, '2.0.0-p451'

Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }