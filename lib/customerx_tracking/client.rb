require "faraday"

require "customerx_tracking/configuration"

module CustomerxTracking
  class Client
    # @return [Configuration] Config instance
    attr_reader :config

    # Creates a new {Client} instance and yields {#config}.
    def initialize
      raise ArgumentError, "block not given" unless block_given?

      @config = CustomerxTracking::Configuration.new
      yield config
    end

    # Creates a connection if there is none, otherwise returns the existing connection.
    #
    # @return [Faraday::Connection] Faraday connection for the client
    def connection
      @connection ||= build_connection
      return @connection
    end

    # Send tracking of API Tracking CustomerX
    def tracker(external_id_client:, type_tracking:, identifier:, email:, additonal_data: {})
      response = connection.post do |req|
        req.body = {
          external_id_client: external_id_client,
          type_tracking: type_tracking,
          identifier: identifier,
          email: email
        }.merge(additonal_data)
      end
    end

    protected

    # Called by {#connection} to build a connection. Can be overwritten in a
    # subclass to add additional middleware and make other configuration
    # changes.
    #
    # Uses middleware according to configuration options.
    #
    # Request logger if logger is not nil
    #
    # Retry middleware if retry is true
    def build_connection
      Faraday.new(config.options) 
    end
  end
end
