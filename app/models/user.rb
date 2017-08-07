require 'bcrypt'

class User < ActiveRecord::Base

  # users.password_digest in the database is a :string
  include BCrypt

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

end
