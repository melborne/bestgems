require 'spec_helper'

describe Bestgems::Client do
  let(:client) { Bestgems::Client.new }

  describe "#total_downloads", vcr:{cassette_name:'total_downloads'} do
    it "gets a hash with date key and download value" do
      res = client.total_downloads('colcolor')
      expect(res).to be_a Hash
      expect(res.keys.first).to match(/\A\d{4}\-\d{2}-\d{2}\z/)
      expect(res.values.first).to be_a Fixnum
    end

    context "with an absent gem name", vcr:{cassette_name:'total_downloads_error'} do
      it "raises NotFound error" do
        expect {client.total_downloads ''}.to raise_error(Bestgems::Client::NotFound)
      end
    end
  end

  describe "#daily_downloads", vcr:{cassette_name:'daily_downloads'} do
    it "gets a hash with date key and download value" do
      res = client.daily_downloads('colcolor')
      expect(res).to be_a Hash
      expect(res.keys.first).to match(/\A\d{4}\-\d{2}-\d{2}\z/)
      expect(res.values.first).to be_a Fixnum
    end
  end

  describe "#total_ranking", vcr:{cassette_name:'total_ranking'} do
    it "gets a hash with date key and ranking value" do
      res = client.total_ranking('colcolor')
      expect(res).to be_a Hash
      expect(res.keys.first).to match(/\A\d{4}\-\d{2}-\d{2}\z/)
      expect(res.values.first).to be_a Fixnum
    end
  end

  describe "#daily_ranking", vcr:{cassette_name:'daily_ranking'} do
    it "gets a hash with date key and ranking value" do
      res = client.daily_ranking('colcolor')
      expect(res).to be_a Hash
      expect(res.keys.first).to match(/\A\d{4}\-\d{2}-\d{2}\z/)
      expect(res.values.first).to be_a Fixnum
    end
  end

  describe "#growth", vcr:{cassette_name:'growth'} do
    it "returns growth point with recent 5 days" do
      res = client.growth('colcolor')
      expect(res).to eq 60885
    end

    it "returns growth point with recent 2 days" do
      res = client.growth('colcolor', base_days:2)
      expect(res).to eq 58805
    end
  end
end
