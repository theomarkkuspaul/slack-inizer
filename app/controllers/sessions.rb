
get '/login' do
  erb :'sessions/new'
end

post '/login' do

  email = params[:email]
  password = params[:password]

  user = User.find_by(email: email)

  if user && user.password == password
    set_user_session(user)
    redirect_user(user)
  else
    erb :'sessions/new'
  end
end
