require 'rubygems'
require 'sinatra'
require 'mongoid'
require 'json'
require 'sinatra/reloader' if development?
require 'erb'
require 'cgi'
# after hours of searching, reading docs, and trying everything under the sun, this solution finally worked. 
# Verified that Mongoid is connected to my Mongo dev db through the Sinatra console and server.
configure do
  Mongoid.configure do |config|
    config.sessions = { 
                        :default => {
                                      :hosts => ["localhost:27017"], :database => "mongoid_dev"
                                    }
                      }
  end
end

=begin
# Previous attempts to get Mongoid to talk to MongoDb

# mongo_uri = 'mongodb://localhost:27017'
# db_name = 'mongoid_dev'
#
# The Mongo::Connection syntax seems to have been deprecated and replaced with Moped::Connection due to the new Moped driver.  I still have 
# not figured out how to get this to work.
# Mongoid.database = Mongo::Connection.from_uri(mongo_uri).db(db_name)

# Alternative method to providing the config.sessions hash.  This references the config for the mongoid setup in different environments.
# Mongoid.load!("mongoid.yml")
=end

# Mongoid by default stores documents in a collection that is the pluralized form of the class name.
# Thus our shirt objects will be stored in a collection named shirts
class Shirt
  
  # Documents are the core objects in Mongoid and any object that is to be persisted to the database must include Mongoid::Document
  include Mongoid::Document
  
  # I have included this so that my shirt documents are automatically instantiated with created_at and updated_at datetime timestamps.
  # At this point, I have not included editing functionality with a dynamic change to updated_at value
  include Mongoid::Timestamps
  
  # Field definitions with associated datatypes.  
  # While unnecessary in an app of this scale, I am using field aliasing to minimize storage requirements and speed up processing time. 
  # MongoDB must store all field information along with every document.  
  field :c, as: :color, type: String
  field :w_s, as: :witty_saying, type: String
  field :s, as: :size, type: Integer
# field :c_at, as: :created_at, type: DateTime, default: ->{ Time.now }
# field :u_at, as: :updated_at, type: DateTime

  # Setting the root path to 
  configure do
   # set :root, File.dirname(__FILE__)
   set :views, File.dirname(__FILE__) + "/views"
  end
  
  #Tilt.register Tilt::ERBTemplate, 'html.erb'
  # 
  # def herb(template, options={}, locals={})
  #   render "html.erb", template, options, locals
  # end

  # def to_json 
  #   super
  # end

  get '/' do
    #'foobar'
    @shirt = Shirt.new
    erb :new
  end

  # accepts parameters from form, saves newly instantiated shirt document to db and returns valid json object (as validated by jslint.com)
  post '/' do
    content_type :json
    @shirt = Shirt.new(params[:shirt])
    @shirt.save
    JSON.generate(params[:shirt])
  end

  get '/search' do
    content_type :json
    params = request.params
    puts params
    
   # params = JSON.generate(CGI::parse(request.query_string))
   #  @shirts = Shirt.find(params)
   #  JSON.generate(params)
   #  Mongoid.collection(params[:shirt]).find.toa.map{|t| frombsonid(t)}.to_json
   #  Shirt.where(color: params[:shirt][:color]).each do |shirt|
   #    JSON.generate(shirt)
   #  end
   #  db.shirts.find({x:4}, {j:true}).forEach(printjson);
  end
  
  # get '/' do
  #   shirt = Shirt.new(:color => "yellow", :witty_saying => "you can do it", :size => 4)
  #   shirt.save
  #   Shirt.where(:size.lte => 2).each { |result| puts result.inspect }
  #   Shirt.where(:size.gte => 4).each { |result| puts result.inspect }
  #   "Here's your size #{shirt.size},#{shirt.color} shirt, which reads #{shirt.witty_saying}"
  # end

end
