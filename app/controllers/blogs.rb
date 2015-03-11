post '/blogs' do
  url = params["url"]
  tags = params["tags"].split(" ").map do |tag|
    Tag.first_or_create(:text => tag)
  end
  Blog.create(:url => url,
              :tags => tags,
              :user_id => session[:user_id])
  redirect to('/')
end

get '/blogs/new' do
  erb :'blogs/new'
end



# post '/peeps' do
#   message = params[:message]
#   Peep.create(:message => message,
#               :time => Time.now,
#               :maker_id => session[:maker_id])
#   redirect to ('/')
# end
