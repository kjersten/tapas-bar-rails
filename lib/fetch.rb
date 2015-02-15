module Fetch
  USERNAME = Rails.application.secrets.ruby_tapas["username"]
  PASSWORD = Rails.application.secrets.ruby_tapas["password"]

  def fetch(path)
    response = connection.get path
    response.body
  end

  def connection
    Faraday.new(:url => 'https://rubytapas.dpdcart.com') do |config|
      config.adapter Faraday.default_adapter
      config.basic_auth(USERNAME, PASSWORD)
    end
  end
end
