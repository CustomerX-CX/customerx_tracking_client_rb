module CustomerxTracking
  @base_url = 'https://tracker.customerx.com.br'

  def self.config
    yield self
  end

  def self.base_url
    @base_url
  end

  def self.base_url=(base_url)
    @base_url = base_url
  end

  def self.credential
    @credential
  end

  def self.credential=(credential)
    @credential = credential
  end

  def self.key
    @key
  end

  def self.key=(key)
    @key = key
  end
end

require 'faraday'
require 'json'

# Core
require 'customerx_tracking/base'
require 'customerx_tracking/requestor'

# Tracker
require 'customerx_tracking/tracker'
