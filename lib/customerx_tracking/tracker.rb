module CustomerxTracking
  class Tracker
    def self.create(params)
      Requestor.new.request(:post, params)
    end
  end
end
