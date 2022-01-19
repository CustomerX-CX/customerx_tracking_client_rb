module CustomerxTracking
  class Base
    def connection
      @connection ||= Faraday.new(faraday_options)
    end

    def authorizations_is_not_present?
      ::CustomerxTracking.credential.nil? || ::CustomerxTracking.key.nil?
    end

    private

    def faraday_options
      {
        headers: {
          'Content-Type' => 'application/json',
          'credential' => CustomerxTracking.credential,
          'key'=> CustomerxTracking.key
        },
        url: ::CustomerxTracking.base_url
      }
    end
  end
end
