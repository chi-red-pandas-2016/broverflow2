before do
  @errors = Array.new
end


get '/login' do
  erb :"/login/index"
end

post '/login' do
  user = User.find_by(username: params[:user][:username])
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect "/questions"
  else
    @errors << "Invalid Username or Password, BRO!"
    erb :"/login/index"
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
