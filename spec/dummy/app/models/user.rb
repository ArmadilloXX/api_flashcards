class User < ActiveRecord::Base
  has_secure_password

  class << self
    def authenticate(email, password)
      user = find_by_email(email)
      user && user.authenticate(password)
    end
  end
end
