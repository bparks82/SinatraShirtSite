require 'sinatra'
require 'mongoid'

configure do
  Mongoid.configure do |config|
    name = 'test'
    host = 'localhost'
    config.master = Mongo::Connection.new.db(name)
    config.slaves = [
      Mongo::Connection.new(host, 27017, :slave_ok => true).db(name)
    ]
  end
end

