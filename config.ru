require './config/environment'

use Rack::MethodOverride

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use BooksController
use UsersController
run ApplicationController