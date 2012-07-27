# Unfuddle

Unfuddle API wrapper


## Usage

    Unfuddle.configure do |config|

      config.account  = 'subdomain'
      config.user     = 'username'
      config.password = 'password'

    end

    c = Unfuddle.client

    c.activity
    c.activity({start_date: Date.today, limit: 5})


## Installation

Add this line to your application's Gemfile:

    gem 'unfuddle'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install unfuddle

## TODO

1. Add more the rest of the endpoints
2. Tests...


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
