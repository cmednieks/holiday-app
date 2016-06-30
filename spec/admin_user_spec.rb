require 'rails_helper'

describe AdminUser do
  
  it "enforces validations for a new user" do
    AdminUser.create(password: "password").should_not be_valid
    AdminUser.create(username: "user").should_not be_valid
    AdminUser.create(username: "too", password: "short").should_not be_valid
  end
  
  
end