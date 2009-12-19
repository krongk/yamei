print "Using native MySQL\n"
require 'logger'

ActiveRecord::Base.logger = Logger.new("debug.log")

db = 'aavisa'

ActiveRecord::Base.establish_connection(
  :adapter  => "mysql",
  :host     => "localhost",
  :username => "root",
  :password => "kenrome",
  :database => db,
  :socket => "/var/run/mysqld/mysqld.sock"
)

load File.dirname(__FILE__) + "/fixtures/schema.rb"
