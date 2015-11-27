module Giphy
  class Search
    def search(terms)
      request.get('/search', { q: terms })
    end

    def request
      Giphy::Request.new
    end
  end
end