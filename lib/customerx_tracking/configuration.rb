module CustomerxTracking
  # Holds the configuration options for the client and connection
  class Configuration
    # @return [String] The basic auth credential.
    attr_accessor :credential

    # @return [String] The basic auth key.
    attr_accessor :key

    # @return [String] The base url
    attr_accessor :base_url

    def initialize
      @base_url = "https://tracking.customerx.com.br/api/v1/trackings"
    end
    # Sets accept and user_agent headers
    #
    # @return [Hash] Faraday-formatted hash of options.
    def options
      {
        headers: {
          accept: "application/json",
          credential: credential,
          key: key
        },
        url: base_url
      }
    end
  end
end
