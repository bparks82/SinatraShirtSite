This is Sinatra application built with MongoDb and Mongoid as the ODM.  I have used the following gems in this project:

gem 'heroku'
gem 'sinatra'
gem 'thin'
gem 'pry'lib/
gem "mongoid"
gem "bson_ext"

Learnings:

- Whenever you make a change to your Sinatra app you have to restart the server (using ctrl-c).  Then revisit your local connection and refresh the page.
- Here's a nice little <a href = "http://net.tutsplus.com/tutorials/ruby/singing-with-sinatra/", target= "_blank">Tutorial</a>
- To get the equivalent of Rails console for a Sinatra app, use: irb -r my_sinatra_app.rb.  Using pry, it's: pry -r my_sinatra_app.rb