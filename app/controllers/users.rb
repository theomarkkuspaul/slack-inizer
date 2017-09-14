
# GET users/1
get '/users/:id' do
  @user = User.find(params[:id])
  erb :"users/show"
end

post '/randomize' do
  payload = {first_name: "testo"}.to_json
  binding.pry
  resp = RestClient.post("https://slack.com/api/users.profile.set", {token: session[:access_token], profile: payload})

end
