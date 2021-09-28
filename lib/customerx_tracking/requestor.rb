module CustomerxTracking
  class Requestor < Base
    def initialize
      raise 'credential and key should be set' if authorizations_is_not_present?
    end

    def request(meth, params = nil)
      meth = meth.downcase

      begin
        response = connection.method(meth).call do |req|
          (if meth == :get then req.params = params else req.body = params end) if params
        end
      rescue
        raise 'it was not possible to carry out the request'
      end

      p response
      { status: response.status, body: JSON.parse(response.body) }
    end
  end
end