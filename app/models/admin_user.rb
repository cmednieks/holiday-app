class AdminUser < ActiveRecord::Base
  validates :username, presence: true
end
