# Bestgems

Ruby wrapper for the BestGems.org API.

>[BestGems -- Ruby Gems Download Ranking](http://bestgems.org/ "BestGems -- Ruby Gems Download Ranking")
>
>[BestGems API v1 Specification · xmisao/bestgems.org Wiki](https://github.com/xmisao/bestgems.org/wiki/BestGems-API-v1-Specification "BestGems API v1 Specification · xmisao/bestgems.org Wiki")

## Installation

Add this line to your application's Gemfile:

    gem 'bestgems'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bestgems

## Usage

```ruby
require 'bestgems'

client = Bestgems.client

client.total_downloads(:rack) # => [{:date=>"2014-08-06", :total_downloads=>48365953}, {:date=>"2014-08-05", :total_downloads=>48305390}, {:date=>"2014-08-04", :total_downloads=>48246069}, {:date=>"2014-08-03", :total_downloads=>48203248}, {:date=>"2014-08-02", :total_downloads=>48172608}, ... ]

client.daily_downloads(:rack) # => [{:date=>"2014-08-06", :daily_downloads=>60563}, {:date=>"2014-08-05", :daily_downloads=>59321}, {:date=>"2014-08-04", :daily_downloads=>42821}, {:date=>"2014-08-03", :daily_downloads=>30640}, ... ]

client.total_ranking(:rack) # => [{:date=>"2014-08-06", :total_ranking=>2}, {:date=>"2014-08-05", :total_ranking=>2}, {:date=>"2014-08-04", :total_ranking=>2}, {:date=>"2014-08-03", :total_ranking=>2}, {:date=>"2014-08-02", :total_ranking=>2}, ... ]

client.daily_ranking(:rack) # => [{:date=>"2014-08-06", :daily_ranking=>6}, {:date=>"2014-08-05", :daily_ranking=>7}, {:date=>"2014-08-04", :daily_ranking=>4}, {:date=>"2014-08-03", :daily_ranking=>3}, {:date=>"2014-08-02", :daily_ranking=>3}, ... ]
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/bestgems/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
