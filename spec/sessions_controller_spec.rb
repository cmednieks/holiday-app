require 'rails_helper'

describe SessionsController do
  
  before do
    AdminUser.create(username: "administrator", password: "password", password_confirmation: "password")
  end
  
  describe "GET #new" do
    
  end
  
  describe "POST #create" do
    context "valid log in information" do
      it "logs in the admin" do
        
      end
      it "redirects the user to the home page" do
      
      end
    end
    context "invalid log in information" do
    end
  end
  
  describe "DELETE destroy" do
    
  end
  
end