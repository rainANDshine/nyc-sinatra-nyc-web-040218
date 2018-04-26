$:.unshift '.'
require 'config/environment'

use Rack::Static, :urls => ['/css'], :root => 'public' # Rack fix allows seeing the css folder.

<<<<<<< HEAD
use Rack::MethodOverride
=======
# if defined?(ActiveRecord::Migrator) && ActiveRecord::Migrator.needs_migration?
#   raise 'Migrations are pending run `rake db:migrate` to resolve the issue.'
# end

>>>>>>> 6b3c48b8fffdc3d5e19e75dcc5078d24345abf94
use LandmarksController
run ApplicationController
