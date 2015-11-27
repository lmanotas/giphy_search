require 'uri'
require 'net/http'

module Giphy
  class Request
    API_URL = 'http://api.giphy.com/v1/gifs'

    def get(endpoint, query_params = {})
      uri = URI("#{API_URL}#{endpoint}")
      uri.query = URI.encode_www_form(query_params.merge!(api_key_param))
      response.process(net.get_response(uri))
    end

    def net
      Net::HTTP
    end

    def api_key_param
      { api_key: Giphy::Config.api_key }
    end

    def response
      Giphy::Response
    end
  end
end