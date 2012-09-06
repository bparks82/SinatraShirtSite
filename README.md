This is Sinatra application built with MongoDb and Mongoid as the ODM.  I have used the following gems in this project:

gem 'heroku'
gem 'sinatra'
gem 'thin'
gem 'pry'lib/
gem "mongoid"
gem "bson_ext"

Learnings:

- Whenever you make a change to your Sinatra app you have to restart the server (using ctrl-c).  Then revisit your local connection and refresh the page.
- Here's a nice little <a href = "http://net.tutsplus.com/tutorials/ruby/singing-with-sinatra/">Tutorial</a>