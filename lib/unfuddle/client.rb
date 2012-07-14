require 'unfuddle/config'
require 'unfuddle/connectable'
require 'unfuddle/account'

module Unfuddle
  class Client

    include Unfuddle::Config
    include Unfuddle::Connectable
    include Unfuddle::Account

    def initialize(options = {})
      Unfuddle::Config.keys.each do |key|
        instance_variable_set("@#{key}", options[key] || Unfuddle.options[key])
      end
    end

  end
end