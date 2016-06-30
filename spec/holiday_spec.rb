require 'rails_helper'
#require 'holiday'

describe Holiday do
  
  describe ".create" do
    context "given valid parameters" do
      it "creates a new holiday instance in the database" do
        FactoryGirl.create(:holiday).should be_valid
      end
    end
    context "given no name or country" do
      it "does not create a new instance" do
        Holiday.create(country: "US")
        Holiday.create(name: "My birthday")
        expect(Holiday.count).to eql(0)
      end
    end
  end
    
  describe ".name" do
    context "given no argument" do 
      it "returns the holiday's name" do
        Holiday.create(name: "foobar", country: "US")
        expect(Holiday.first.name).to eql("foobar")
      end
    end
    context "given string argument" do
      it "changes the holiday's name when saved" do
        h = Holiday.create(name: "foobar", country: "US")
        h.name = "raboof"
        h.save
        expect(Holiday.first.name).to eql("raboof")
      end
    end
  end
  
end