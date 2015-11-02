require 'rails_helper'

describe Message, :vcr => true do
  it "doesn't save the message if form has an invalid to number" do
    message = Message.new(:body => 'Hey!', :to => "333333", :from => "4152149646" )
    message.save.should be false
  end

  it "adds an error if the number is invalid" do
    message = Message.new(:body => 'Hey!', :to => "333333", :from => "4152149646" )
    message.save
    message.errors[:base].should eq ["The 'To' number 333333 is not a valid phone number."]
  end
end
