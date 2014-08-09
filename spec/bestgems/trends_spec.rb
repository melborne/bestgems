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

  describe "#featured_ranking", vcr:{cassette_name:'featured_ranking'} do
    it "returns recent growth of ranking" do
      res = client.featured_ranking('colcolor')['2014-08-06']
      expect(res).to eq (68455-8533)
    end
  end
end
