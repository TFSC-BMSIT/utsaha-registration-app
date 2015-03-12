require 'httparty'

class SMSSender
  @@API_key = ENV['SINFINI_API_KEY']
  @@base_uri = "https://alerts.sinfini.com/apiv2/"

  def self.send(mobile_no, message)
    response = HTTParty.get(@@base_uri,
                 query: {
                   api: "http",
                   workingkey: @@API_key,
                   to: mobile_no,
                   sender: "BMSITM",
                   message: message
                 }).response

    return (response.code == "200")
  end

end
