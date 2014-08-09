require 'spec_helper'

describe Bestgems::Client do
  let(:client) { Bestgems::Client.new }

  describe "#total_downloads", vcr:{cassette_name:'total_downloads'} do
    it "gets an array of data hashes" do
      res = client.total_downloads('colcolor')
      expect(res).to be_a Array
      expect(res.first).to be_a Hash
      expect(res.first.keys).to contain_exactly(:date, :total_downloads)
    end

    context "with an absent gem name", vcr:{cassette_name:'total_downloads_error'} do
      it "raises NotFound error" do
        expect {client.total_downloads ''}.to raise_error(Bestgems::Client::NotFound)
      end
    end
  end

  describe "#daily_downloads", vcr:{cassette_name:'daily_downloads'} do
    it "gets an array of data hashes" do
      res = client.daily_downloads('colcolor')
      expect(res).to be_a Array
      expect(res.first).to be_a Hash
      expect(res.first.keys).to contain_exactly(:date, :daily_downloads)
    end
  end

  describe "#total_ranking", vcr:{cassette_name:'total_ranking'} do
    it "gets an array of data hashes" do
      res = client.total_ranking('colcolor')
      expect(res).to be_a Array
      expect(res.first).to be_a Hash
      expect(res.first.keys).to contain_exactly(:date, :total_ranking)
    end
  end

  describe "#daily_ranking", vcr:{cassette_name:'daily_ranking'} do
    it "gets an array of data hashes" do
      res = client.daily_ranking('colcolor')
      expect(res).to be_a Array
      expect(res.first).to be_a Hash
      expect(res.first.keys).to contain_exactly(:date, :daily_ranking)
    end
  end

  describe "#featured_ranking", vcr:{cassette_name:'featured_ranking'} do
    it "returns recent growth of ranking" do
      res = client.featured_ranking('colcolor').find { |h| h[:date]=='2014-08-06' }
      expect(res).to eq({date:'2014-08-06', featured_ranking:(68455-8533)})
    end
  end
end
