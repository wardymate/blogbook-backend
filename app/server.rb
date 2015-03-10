require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'

require_relative 'models/blog'
require_relative 'models/tag'
require_relative 'models/user'
require_relative 'data_mapper_setup'

enable :sessions
set :session_secret, 'super secret'

get '/' do
  @blogs = Blog.all
  erb :index
end

post '/blogs' do
  url = params["url"]
  tags = params["tags"].split(" ").map do |tag|
    Tag.first_or_create(:text => tag)
  end
  Blog.create(:url => url, :tags => tags)
  redirect to('/')
end

get '/tags/:text' do
  tag = Tag.first(:text => params[:text])
  @blogs = tag ? tag.blogs : []
  erb :index
end

get '/users/new' do
  erb :"users/new"
end

post '/users' do
  user = User.create(:email => params[:email],
                     :password => params[:password])
  session[:user_id] = user.id
  redirect to('/')
end

helpers do

  def current_user
    @current_user ||=User.get(session[:user_id]) if session[:user_id]
  end

end