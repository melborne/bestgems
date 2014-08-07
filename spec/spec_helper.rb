$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'bestgems'
require "vcr"
require "webmock/rspec"

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
  c.configure_rspec_metadata!
end
