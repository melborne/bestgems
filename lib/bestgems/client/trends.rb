require "json"

module Bestgems
  class Client
    module Trends
      def total_downloads(gem_name)
        res = get "#{Bestgems.api_gems_endpoint}/#{gem_name}/total_downloads.json"
        json2rb_obj(res)
      end

      def daily_downloads(gem_name)
        res = get "#{Bestgems.api_gems_endpoint}/#{gem_name}/daily_downloads.json"
        json2rb_obj(res)
      end

      def total_ranking(gem_name)
        res = get "#{Bestgems.api_gems_endpoint}/#{gem_name}/total_ranking.json"
        json2rb_obj(res)
      end

      def daily_ranking(gem_name)
        res = get "#{Bestgems.api_gems_endpoint}/#{gem_name}/daily_ranking.json"
        json2rb_obj(res)
      end

      def json2rb_obj(data)
        JSON.parse(data).map do |h|
          h.inject({}) { |h, (k, v)| h[k.intern] = v; h }
        end
      end
    end
  end
end
