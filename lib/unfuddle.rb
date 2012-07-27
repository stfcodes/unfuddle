require "unfuddle/core/version"
require 'unfuddle/core/config'
require 'unfuddle/core/client'

module Unfuddle
  class << self

    include Unfuddle::Config

    def client(options = {})
      Unfuddle::Client.new(self.options.merge(options))
    end

    def options
      @options = {}
      Unfuddle::Config.keys.each do |key|
        @options[key] = instance_variable_get("@#{key}")
      end
      @options
    end

  end
end
