post '/login' do
  user = User.find_by(username: params[:username])
  if user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/notes'
  end
  erb :login_home
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
