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

      # return: growth point based on diff between total and daily ranking
      #         in base_days(default: 5).
      def growth(gem_name, base_days:5)
        total = total_ranking(gem_name)
        daily = daily_ranking(gem_name)
        total, daily = [total, daily].map do |data|
          data.take(base_days).inject(0) { |m, (_, rank)| rank ? m + rank : m }
        end
        (total - daily) / base_days
      end

      def json2rb_obj(data)
        JSON.parse(data).inject({}) do |mem, h|
          date, val = h.values
          mem[date] = val
          mem
        end
      end
    end
  end
end
