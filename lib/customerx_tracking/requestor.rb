module CustomerxTracking
  class Requestor < Base
    def initialize
      super
      raise 'authorization or credential and key should be set' if authorizations_is_not_present?
    end

    def request(meth, params = nil)
      meth = meth.downcase

      begin
        p JSON.parse(params.to_json)
        response = connection.method(meth).call do |req|
          (meth == :get ? (req.params = params) : (req.body = params.to_json)) if params
        end
      rescue StandardError => e
        raise "it was not possible to carry out the request #{e}"
      end

      { status: response.status, body: JSON.parse(response.body) }
    end
  end
end
