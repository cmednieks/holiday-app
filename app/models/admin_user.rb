class AdminUser < ActiveRecord::Base
  validates :username, presence: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
