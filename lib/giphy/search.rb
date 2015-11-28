module Giphy
  class Search
    def search(options)
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