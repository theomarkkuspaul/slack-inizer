

get '/oauth2/callback' do

  return redirect_homepage if !logged_in?

  client_id = settings.slack_client_id
  client_secret = settings.slack_client_secret
  token = params[:code]
  url = "https://slack.com/api/oauth.access?client_id=#{client_id}&client_secret=#{client_secret}&code=#{token}"
  resp = RestClient.get(url)
  parsed_resp = JSON.parse(resp.body)
  session[:access_token] = parsed_resp["access_token"]
  session[:user_id] = parsed_resp["user_id"]

  auth = Authorization.new(user_id: user.id, access_token: parsed_resp["access_token"], auth_type: "slack")

  if auth.save
    # todo
    # success handling
    redirect '/users/' + user.id.to_s
  else
    # todo
    # error handling
    redirect '/users/' + user.id.to_s
  end

end
