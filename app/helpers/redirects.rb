helpers do

  def redirect_home
    redirect '/'
  end

  def redirect_user(user)
    if user.valid?
      redirect '/users/' + user.id.to_s
    end
  end

end