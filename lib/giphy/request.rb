require 'uri'
require 'net/http'

module Giphy
  class Request

    #Giphy::Request handles the request to the giphy api, using Net::HTTP and URI standard libraries from Ruby

    API_URL = 'http://api.giphy.com/v1/gifs' # API Url

    # Defining a general GET method to hit a particular endpoint 

    attr_reader :pagination

    def get(endpoint, query_params = {})
      # building the complete URL using the API_URL, the endpoint action and some query_params
      # the api_key param is merged here and passed in the query_params
      uri = URI("#{API_URL}#{endpoint}")
      uri.query = query_params.merge(api_key_param).to_query
      # To handle the response, once the request is done then is processed by Giphy::Response
      # Will return the proper parsed object.
      whole_response = response.process(net.get_response(uri))
      # Storing pagination info.
      @pagination = whole_response["pagination"]
      # Returning the data body.
      whole_response["data"]
    end

    def net
      # The net library class used to make the requests
      Net::HTTP
    end

    def api_key_param
      # Returns the api_key from the Giphy::Configuration in a hash ready to be merged in the query_params
      { api_key: Giphy::Config.api_key }
    end

    def response
      # Returns the Response class to handle and process the returned response from the API
      Giphy::Response
    end

  end
end