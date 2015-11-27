module Giphy
  class Response
    # Giphy::Response is responsable to handle the response from the API    
    def self.process(http_response)
      # taking the response object from Net::HTTP, idealy should be a Net::HTTPSuccess
      # The body will be parsed with the Json standard Ruby library
      JSON.parse( http_response.body )["data"]
    end
  end
end