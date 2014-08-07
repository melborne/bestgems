require "faraday"
require "bestgems/client/trends"

module Bestgems
  class Client
    include Bestgems::Client::Trends

    class NotFound < StandardError; end

    def get(url, **opts)
      request :get, url, opts
    end

    def request(method, path, **opts)
      response = agent.send(method, path.to_s, opts)
      case response.status
      when 404
        raise NotFound
      when 200
        response.body
      end
    end

    def agent
      @agent ||= ::Faraday.new do |http|
        http.request :url_encoded
        # http.response :logger
        http.adapter :net_http
      end
    end
  end
end
