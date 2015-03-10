require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'

require_relative 'models/blog'
require_relative 'models/tag'
require_relative 'data_mapper_setup'


get '/' do
  @blogs = Blog.all
  erb :index
end

post '/blogs' do
  url = params["url"]
  title = params["title"]
  tags = params["tags"].split(" ").map do |tag|
    Tag.first_or_create(:text => tag)
  end
  Blog.create(:url => url, :title => title, :tags => tags)
  redirect to('/')
end

get '/tags/:text' do
  tag = Tag.first(:text => params[:text])
  @blogs = tag ? tag.blogs : []
  erb :index
end