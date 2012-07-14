require 'faraday'
require 'unfuddle/config'

module Unfuddle
  module Connectable

    def connect!
      @connection ||= Faraday.new(self.account_root, Unfuddle::Config.connection_options.merge(builder: Unfuddle::Config.middleware))
      @connection.basic_auth(self.user, self.password)
      @connection
    end

  end
end