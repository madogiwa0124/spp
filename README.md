# Spp

![spp ci](https://github.com/Madogiwa0124/spp/workflows/spp%20ci/badge.svg)
[![Gem Version](https://badge.fury.io/rb/spp.svg)](https://badge.fury.io/rb/spp)

`spp` is super pretty print library.
It is useful for log output etc.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'spp'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install spp

## Usage

How to use spp is easy.

``` ruby
Spp::spp('hoge')
=>
========== START ==========
"hoge"
========== E N D ==========

# same as below
# puts "========== START =========="
# pp 'hoge'
# puts "========== E N D =========="
```

You can also specify modifiers with arguments.
``` ruby
Spp::spp('hoge', 'start', 'end', '😃' * 5)
=>
😃😃😃😃😃 start 😃😃😃😃😃
"hoge"
😃😃😃😃😃 end 😃😃😃😃😃
```

You can also pass the block and take the benchmark.
``` ruby
Spp::spp_bench('start', 'end', '😃' * 5) do
  # some kind of processing
end
=>
😃😃😃😃😃 start(2018-08-09 08:41:09.821 +0900) 😃😃😃😃😃
"hoge"
😃😃😃😃😃 end(2018-08-09 08:41:12.821 +0900) 😃😃😃😃😃
```
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Madogiwa0124/spp. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Spp project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Madogiwa0124/spp/blob/master/CODE_OF_CONDUCT.md).
