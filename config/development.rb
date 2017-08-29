configure :development do

  set :slack_client_id, ENV["SLACK_CLIENT_ID"]
  set :slack_client_secret, ENV["SLACK_CLIENT_SECRET"]

end