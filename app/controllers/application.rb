get '/' do
  @blogs = Blog.all
  erb :index
end