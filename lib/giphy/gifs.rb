module Giphy
  class Gifs
    def get(id)
      request.get("/#{id}")
    end

    def request
      @request ||= Giphy::Request.new
    end
  end
end