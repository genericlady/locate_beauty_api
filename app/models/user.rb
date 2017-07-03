class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_secure_token :auth_token

  before_create :ensure_auth_token_is_unique

  def ensure_auth_token_is_unique
    if User.find_by auth_token: self.auth_token
      self.auth_token = self.class.generate_unique_secure_token
    end
  end

end
