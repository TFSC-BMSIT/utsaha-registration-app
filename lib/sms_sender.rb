require 'httparty'

class SMSSender
  @@API_key = ENV['SINFINI_API_KEY']
  @@base_uri = "https://alerts.sinfini.com/apiv2/"

  def self.send_sms(mobile_no, message)
    response = HTTParty.get(@@base_uri,
                 query: {
                   api: "http",
                   workingkey: @@API_key,
                   to: mobile_no,
                   sender: "BMSITM",
                   message: message
                 }).response

    if response.code != "200"
      logger.error "Unable to send SMS to #{mobile_no}"
    end

    return (response.code == "200")
  end

end
