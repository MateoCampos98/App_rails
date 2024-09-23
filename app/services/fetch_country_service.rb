require "net/http"

class FetchCountryService
  attr_reader :ip

  def def initialize(ip)
    @ip = ip
  end

  def perform
    uri = URI("http://ip-api.com/json/#{ip}")
    response = Net::HTTP.get(uri)
    parsed_reponse = JSON.parse(response)
    status = parsed_reponse.dig("status").downcase
    if status = "success"
      parsed_reponse.dig("countryCode").downcase
    else
      nil
    end
  rescue
    nil
  end
end