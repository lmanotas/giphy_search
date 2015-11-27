module Giphy
  class Config
    # Giphy::Config, gives the proper methods to setup the Giphy Api configurations
    class << self
      # Attr_Accessor for api_key
      attr_accessor :api_key

      # #setup receives a block to be executed normally in an Initializer.
      # The api_key can be set
      def setup(&block)
        yield self
        self
      end
    end
  end
end