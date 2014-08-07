require "bestgems/version"
require "bestgems/client"

module Bestgems
  API_HOST = "http://bestgems.org/api".freeze
  API_VERSION  = "v1".freeze

  class << self
    def api_host
      ENV['BESTGEMS_API_HOST'] || API_HOST
    end

    def api_version
      ENV['BESTGEMS_API_VERSION'] || API_VERSION
    end

    def api_gems_endpoint
      File.join(api_host, api_version, 'gems')
    end

    def client
      @client ||= Client.new
    end
  end
end
