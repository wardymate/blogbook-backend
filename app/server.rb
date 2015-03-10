require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'

require_relative 'models/blog'
require_relative 'data_mapper_setup'


get '/' do
  @blogs = Blog.all
  erb :index
end

post '/blogs' do
  url = params["url"]
  title = params["title"]
  Blog.create(:url => url, :title => title)
  redirect to('/')
end