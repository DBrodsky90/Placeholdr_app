require 'rails_helper'

describe User do 
  
  let(:david) { User.new( username: "dbrodsky",
                       first_name: "David",
                       last_name: "Brodsky",
                       avatar: "asd",
                       password: "hunter2",
                       password_confirmation: "hunter2") }
  
  it "is valid with a username, firstname, lastname, and password" do
    expect(david).to be_valid
  end
 
 it "is invalid without a first name" do
   new_user = User.new(first_name: nil)
   expect(new_user).to have(1).errors_on(:first_name)
 end
 
 it "is invalid without a username" do
   new_user = User.new(username: nil)
   expect(new_user).to have(1).errors_on(:username)
 end
 
 it "must have matching password and password confirmation" do
   new_user  = User.new( username: "superman",
                        first_name: "Hari",
                        password: "hunter2",
                        password_confirmation: "aaa")
                        
  errors = new_user.errors_on(:password_confirmation)
  error_included = errors.include?("doesn't match Password")
  expect(error_included).to eq(true)
 end
 
 it "is invalid without a unique username" do
   david.save!
   mck = User.new( username: "dbrodsky",
            first_name: "pooper",
            password: "correcthorsebatterystaple",
            password_confirmation: "correcthorsebatterystaple")
  expect(mck).to have(1).errors_on(:username)
 end
 
end