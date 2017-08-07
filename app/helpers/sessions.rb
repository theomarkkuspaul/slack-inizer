helpers do

  def logged_in?
    # does 'user' exist in db
    # and is the user's email in the current session
    user && !session[:email].nil?
  end

  def user
    User.find_by(email: session[:email])
  end

  def clear_session
    session.delete(:email) if session[:email]
  end

  def set_user_session(user)
    session[:email] = user.email if user.email
  end

end