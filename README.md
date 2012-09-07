This is my first Sinatra application built with MongoDb and Mongoid as the ODM.  I have used the following gems in this project:

gem 'heroku'
gem 'sinatra'
gem 'thin'
gem 'pry'
gem "mongoid"
gem "bson_ext"

and have required the following libraries from the Ruby standard library:

'json' - to convert document objects pulled from the database into json objects for rendering
'erb' - for templating purposes.  Alternatively, you could use haml or erubis. 
'cgi' - previously used for parsing incoming request.  In its current state, the app takes care of the parsing without the need for CGI.

Please reference the main file shirt.rb for comments.  You can run the app from the root directory by typing either rackup -p 4567 or ruby shirt.rb to start the server and then moving through the routes.

My Learnings working on this app:

- Whenever you make a change to your Sinatra app you have to restart the server (using ctrl-c).  Then revisit your local connection and refresh the page.
- Here's a nice little <a href = "http://net.tutsplus.com/tutorials/ruby/singing-with-sinatra/", target= "_blank">Tutorial</a>
- To get the equivalent of Rails console for a Sinatra app, use: irb -r my_sinatra_app.rb.  Using pry, it's: pry -r my_sinatra_app.rb
- Sinatra is super flexible when it comes to routing, which is essentially an HTTP method and a regular expression to match the requested URL
- rackup -p 4567 to run Sinatra server with Thin.  Need to kill server (ctrl-c) before refreshing browser with changes
- to access the mongo shell, just type in 'mongo' when in your root directory