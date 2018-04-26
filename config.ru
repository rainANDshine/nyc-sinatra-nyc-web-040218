$:.unshift '.'
require 'config/environment'

use Rack::Static, :urls => ['/css'], :root => 'public' # Rack fix allows seeing the css folder.

<<<<<<< HEAD

use Rack::MethodOverride

use FiguresController
=======
# if defined?(ActiveRecord::Migrator) && ActiveRecord::Migrator.needs_migration?
#   raise 'Migrations are pending run `rake db:migrate` to resolve the issue.'
# end

use Rack::MethodOverride
>>>>>>> 46f64c899fc8ca5b1d750d424a810780de13ee34
use LandmarksController
use TitlesController
run ApplicationController
