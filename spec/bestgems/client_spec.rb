require 'spec_helper'

describe Bestgems::Client do
  describe ".get", vcr:{cassette_name:'get'} do
    let(:client) { Bestgems::Client.new }
    before do
      @test_endpoint = "http://bestgems.org"
    end

    it "handles request" do
      client.get @test_endpoint
      assert_requested :get, @test_endpoint
    end
  end
end
