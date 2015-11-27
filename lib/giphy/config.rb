module Giphy
  class Config
    class << self
      attr_accessor :api_key

      def setup(&block)
        yield self
        self
      end
    end
  end
end