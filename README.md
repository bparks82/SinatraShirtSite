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
- Sinatra is super flexible when it comes to routing, which is essentially an HTTP method and a regular expression to match the requested URL
- Mongo shell examples:
   Saving
  Here's how you save a document to MongoDB:
    db.scores.save({a: 99}); 

  This says, "save the document '{a: 99}' to the 'scores' collection."
  Go ahead and try it. Then, to see if the document was saved, try
    db.scores.find(); 
  Once you've tried this, type 'next'.

  >
  "ok"
  >

  [ 
    {   "size" : 4,   "_id" : {   "$oid" : "5048cf16cc93742e0d0d4f8b"   },   "color" : "yellow",   "witty_saying" : "hahaha"   }
  ]