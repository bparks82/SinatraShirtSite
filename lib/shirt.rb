require 'sinatra'
require 'mongoid'
require 'json'
require 'sinatra/reloader' if development?

Mongoid.load!("mongoid.yml")

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

  def to_json 
      super
    end

end