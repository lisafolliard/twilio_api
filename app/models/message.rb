class Message < ActiveRecord::Base
  before_create :send_sms

private

  def send_sms
    response = RestClient::Request.new(
      :method => :post,
      :url => 'https://api.twilio.com/2010-04-01/Accounts/ACca8b73ec6837965bc7ac1e55d84d283e/Messages.json',
      :user => 'ACca8b73ec6837965bc7ac1e55d84d283e',
      :password => '97d96926a89c62e320e6b2963287165d',
      :payload => { :Body => body,
                    :From => from,
                    :To => to }
    ).execute

  end
end
