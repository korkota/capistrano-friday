# capistrano-friday

![https://twitter.com/iamdevloper/status/450905958139834368](https://pbs.twimg.com/media/BkHwlGBIgAEsSP7.jpg)

Why you [deploy](https://github.com/capistrano/capistrano) on friday?!

*(inspired by [twitter joke](https://twitter.com/yurykusik/status/556064634525204481))*

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano-friday'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-friday

## Usage

Require in Capfile to use the task:

```ruby
# Capfile
require 'capistrano/friday'
```

In your `config/deploy.rb` (or `config/deploy/production.rb`) do something like that:

```ruby
# config/deploy.rb
before 'deploy:starting', 'friday:check'
```

## Options

In default configuration it's just a warning but you can completely disable deploying by setting:

```ruby
set :friday_disable_deploy, true
```

You also can change default MOTD (default is `:base_jumper`):

```ruby
set :friday_motd, :flipping_table
```

Ignore stages, so not as to punish the testing of code:

```ruby
set :friday_ignored_stages, :staging
# or
set :friday_ignored_stages, [:staging, :testing]
# or completely remove
set :friday_ignored_stages, nil
```

By default, `:staging` is already ignored.

**TODO:** need to add many more MOTDs!

## Contributing

1. Fork it ( https://github.com/marshall-lee/capistrano-friday/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
