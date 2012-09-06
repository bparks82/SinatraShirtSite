require 'rubygems'
require 'sinatra'
require 'mongoid'
require 'json'
require 'sinatra/reloader' if development?

configure do
  Mongoid.configure do |config|
    config.sessions = { 
                        :default => {
                                      :hosts => ["localhost:27017"], :database => "mongoid_dev"
                                    }
                      }
  end
end

# mongo_uri = 'mongodb://localhost:27017'
# db_name = 'mongoid_dev'
# 
# Mongoid.database = Mongo::Connection.from_uri(mongo_uri).db(db_name)

# Mongoid.load!("mongoid.yml")

# Mongoid by default stores documents in a collection that is the pluralized form of the class name.
# Thus our shirt objects will be stored in a collection named shirts

class Shirt
  # Documents are the core objects in Mongoid and any object that is to be persisted to the database must include Mongoid::Document
  include Mongoid::Document
  include Mongoid::Timestamps
  # Field definitions with associated datatypes.  
  # Using field aliasing to minimize storage requirements and speed up processing time. MongoDB must store all field information along with every document.  
  field :c, as: :color, type: String
  field :w_s, as: :witty_saying, type: String
  field :s, as: :size, type: Integer
  #field :c_at, as: :created_at, type: DateTime, default: ->{ Time.now }
  #field :u_at, as: :updated_at, type: DateTime

  # configure do
  #   set :root, File.dirname(__FILE__)
  # end
  # 
  # Mongoid.configure do |config|
  #   if ENV['MONGOHQ_URL']
  #     conn = Mongo::Connection.from_uri(ENV['MONGOHQ_URL'])
  #     uri = URI.parse(ENV['MONGOHQ_URL'])
  #     config.master = conn.db(uri.path.gsub(/^\//, ''))
  #   else
  #     Mongoid.configure do |config|
  #       name = 'mongoid_dev'
  #       host = 'localhost'
  #       config.master = Mongo::Connection.new.db(name)
  #     end
  #     # config.master = Mongo::Connection.from_uri("mongodb://localhost:27017").db('mongoid_dev')
  #   end
  # end

  def to_json 
    super
  end
  
  get '/' do
    shirt = Shirt.new(:color => "yellow", :witty_saying => "you can do it", :size => 4)
    shirt.save
    Shirt.where(:size.lte => 2).each { |result| puts result.inspect }
    Shirt.where(:size.gte => 4).each { |result| puts result.inspect }
    "Here's your size #{shirt.size},#{shirt.color} shirt, which reads #{shirt.witty_saying}"
  end

  get '/:env' do
    ENV.inspect
    ENV['DATABASE_URI']
  end
end
