module Giphy
  class Search
    def search(options)
      # Using the Giphy::Request object to perform the get request
      request.get('/search', options)
    end

    def request
      @request ||= Giphy::Request.new
    end

    def pagination
      request.pagination
    end
  end
end