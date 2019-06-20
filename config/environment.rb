require "sinatra/activerecord"
require "pry"
require 'colorize'
require 'colorized_string'
require "require_all"

require_all "lib"

ActiveRecord::Base.establish_connection(
    adapter: "sqlite3",
    database: "db/characters.db"
)

ActiveRecord::Base.logger = nil

main_menu

# binding.pry