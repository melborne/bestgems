require "json"
require "date"

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
        total.inject({}) do |mem, (t_date, t_rank)|
          mem[t_date] = daily[t_date] ? t_rank - daily[t_date] : nil
          mem
        end
      end

      def json2rb_obj(data)
        JSON.parse(data).inject({}) do |mem, h|
          date, val = h.values
          mem[Date.parse date] = val
          mem
        end
      end
    end
  end
end
