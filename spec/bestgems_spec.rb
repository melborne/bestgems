require 'spec_helper'

describe Bestgems do
  it 'has a version number' do
    expect(Bestgems::VERSION).not_to be nil
  end

  describe ".client" do
    it "creates an Bestgems Client" do
      expect(Bestgems.client).to be_kind_of Bestgems::Client
    end
  end

end
