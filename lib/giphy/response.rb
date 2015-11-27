module Giphy
  class Response
    
    def self.process(http_response)
      JSON.parse( http_response.body )
    end
  end
end