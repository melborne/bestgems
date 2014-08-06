require "faraday"
require "bestgems/client/trends"

module Bestgems
  class Client
    include Bestgems::Client::Trends

    def get(url, **opts)
      request :get, url, opts
    end

    def request(method, path, data, **opts)
      response = agent.send(method, path.to_s, data, opts)
      response.body
    end

    def agent
      @agent ||= ::Faraday.new do |http|
        http.request :url_encoded
        http.response :logger
        http.adapter :net_http
      end
    end
  end
end
