get '/tags/:text' do
  tag = Tag.first(:text => params[:text])
  @blogs = tag ? tag.blogs : []
  erb :index
end