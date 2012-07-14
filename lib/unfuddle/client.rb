require 'unfuddle/config'

module Unfuddle
  class Client

    include Unfuddle::Config

    def initialize(options = {})
      Unfuddle::Config.keys.each do |key|
        instance_variable_set("@#{key}", options[key] || Unfuddle.options[key])
      end
    end

  end
end