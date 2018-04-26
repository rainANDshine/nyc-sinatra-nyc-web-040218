ENV["SINATRA_ENV"] = "test"

require_relative '../config/environment'
require 'rack/test'
require 'capybara/rspec'
require 'capybara/dsl'

<<<<<<< HEAD
=======
# if defined?(ActiveRecord::Migrator) && ActiveRecord::Migrator.needs_migration?
#   raise 'Migrations are pending run `rake db:migrate SINATRA_ENV=test` to resolve the issue.'
# end
>>>>>>> 6b3c48b8fffdc3d5e19e75dcc5078d24345abf94

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.include Rack::Test::Methods
  config.include Capybara::DSL


  config.order = 'default'
end


ActiveRecord::Base.logger.level = 1

def app
  Rack::Builder.parse_file('config.ru').first
end

Capybara.app = app
