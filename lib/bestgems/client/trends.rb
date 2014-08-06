require "json"

module Bestgems
  class Client
    module Trends
      def total_downloads(gem_name)
        res = get "#{Bestgems.api_gems_endpoint}/#{gem_name}/total_downloads.json"
        JSON.parse(res)
      end

      def daily_downloads(gem_name)
        res = get "#{Bestgems.api_gems_endpoint}/#{gem_name}/daily_downloads.json"
        JSON.parse(res)
      end

      def total_ranking(gem_name)
        res = get "#{Bestgems.api_gems_endpoint}/#{gem_name}/total_ranking.json"
        JSON.parse(res)
      end

      def daily_ranking(gem_name)
        res = get "#{Bestgems.api_gems_endpoint}/#{gem_name}/daily_ranking.json"
        JSON.parse(res)
      end
    end
  end
end
