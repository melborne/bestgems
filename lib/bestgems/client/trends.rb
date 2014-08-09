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

      def featured_ranking(gem_name)
        total = total_ranking(gem_name)
        daily = daily_ranking(gem_name)
        featured = total.inject([]) do |arr, t_hash|
          if match = daily.find { |h| h[:date] == t_hash[:date] }
            arr << {date: t_hash[:date], featured_ranking:(t_hash[:total_ranking] - match[:daily_ranking])}
          else
            arr << {date: t_hash[:date], featured_ranking:nil}
          end
          arr
        end
      end

      def json2rb_obj(data)
        JSON.parse(data).map do |h|
          h.inject({}) { |h, (k, v)| h[k.intern] = v; h }
        end
      end
    end
  end
end
