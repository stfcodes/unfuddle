require 'unfuddle/core/config'
require 'unfuddle/core/connectable'
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

    def credentials?
      Unfuddle::Config.keys.map do |key|
        instance_variable_get("@#{key}")
      end.all?
    end

  end
end