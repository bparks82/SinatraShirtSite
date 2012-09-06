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

get '/' do
  
  shirt = Shirt.new(:color => "yellow", :witty_saying => "you can do it", :size => 4)
  shirt.save
  "Here's your size #{shirt.size},#{shirt.color} shirt, which reads #{shirt.witty_saying} "
end