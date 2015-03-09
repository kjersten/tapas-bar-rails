module Fetch
  USERNAME = Rails.application.secrets.ruby_tapas["username"]
  PASSWORD = Rails.application.secrets.ruby_tapas["password"]

  def fetch(url)
    uri = URI(url)

    Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
      request = Net::HTTP::Get.new uri
      request.basic_auth(USERNAME, PASSWORD)

      http.request(request) { |response| stream_to_file(response) }
    end

    response_file
  end

  private

  def response_file
    @response_file ||= Tempfile.new("response", "tmp/")
  end

  def stream_to_file(response)
    File.open response_file, 'wb' do |io|
      response.read_body do |chunk|
        io.write chunk
      end
    end
  end
end
