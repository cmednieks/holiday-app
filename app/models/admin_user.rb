class AdminUser < ActiveRecord::Base
  validates :username, presence: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  
  # Returns the hash digest of the given string.
  def AdminUser.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
