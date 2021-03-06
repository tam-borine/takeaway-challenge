require 'twilio-ruby'
require 'dotenv'

class Dispatch
Dotenv.load

  def send_sms

  id = ENV["AUTH_ID"]
  pw = ENV["AUTH_TOKEN"]
  customers = { ENV["NUMBER1"] => "insert_name_here"}

  @client = Twilio::REST::Client.new id, pw

    customers.each do |number,name|
      message = @client.messages.create(
        from: ENV["NUMBER3"],
        to: number,
        body: "Dear #{name} Order successfully placed! Expect delivery before #{Time.now + 1*60**2}")

      puts "Sent message to #{name}"
    end
  end
end
