module CustomerxTracking
  class Base
    def connection
      @connection ||= Faraday.new(faraday_options)
    end

    def authorizations_is_not_present?
      ::CustomerxTracking.authorization.nil? && (::CustomerxTracking.credential.nil? || ::CustomerxTracking.key.nil?)
    end

    private

    def faraday_options
      {
        headers: {
          'Content-Type' => 'application/json'
        }.merge(validate_authorization),
        url: ::CustomerxTracking.base_url
      }
    end

    def validate_authorization
      return { authorization: ::CustomerxTracking.authorization } unless ::CustomerxTracking.authorization.nil?

      {
        credential: ::CustomerxTracking.credential,
        key: ::CustomerxTracking.key
      }
    end
  end
end
