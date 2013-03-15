require 'sinatra'
require 'slim'
require 'sass'

# add sprockets in future
# import libs
# import routes

get '/styles.css' do
  scss :styles
end

get '/' do
  @content = "Hey there"
  slim :index
end
