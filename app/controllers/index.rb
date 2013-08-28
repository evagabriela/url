require 'faker'

get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/short_url' do 
  @user = params[:user_input] 
  @instance_url =Url.create!(:long_url => @user, :short_url => (Faker::Lorem.characters(char_count = 5) + ".ly") )
  erb :short_url
end


get '/:short_url' do
  # redirect to appropriate "long" URL
  example = Url.find_by_short_url(params[:short_url])
  example.counter +=1
  puts "this is example.counter: #{example.counter}"
  example.save!
  long_url = Url.last.long_url
  redirect to "http://#{long_url}"
end