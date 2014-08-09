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

client.total_downloads(:rack) # => {"2014-08-08"=>48484297, "2014-08-07"=>48426620, "2014-08-06"=>48365953, "2014-08-05"=>48305390, "2014-08-04"=>48246069, "2014-08-03"=>48203248, ... }

client.daily_downloads(:rack) # => {"2014-08-08"=>57677, "2014-08-07"=>60667, "2014-08-06"=>60563, "2014-08-05"=>59321, "2014-08-04"=>42821, "2014-08-03"=>30640, ... }

client.total_ranking(:rack) # => {"2014-08-08"=>2, "2014-08-07"=>2, "2014-08-06"=>2, "2014-08-05"=>2, "2014-08-04"=>2, "2014-08-03"=>2, "2014-08-02"=>2, "2014-08-01"=>2, "2014-07-31"=>2, ... }

client.daily_ranking(:rack) # => {"2014-08-08"=>6, "2014-08-07"=>6, "2014-08-06"=>6, "2014-08-05"=>7, "2014-08-04"=>4, "2014-08-03"=>3, "2014-08-02"=>3, "2014-08-01"=>6, "2014-07-31"=>6, ... }
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/bestgems/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
