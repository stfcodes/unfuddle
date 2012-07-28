require 'unfuddle/core/config'
require 'unfuddle/core/connectable'
require 'unfuddle/account'
require 'unfuddle/projects'
require 'unfuddle/repositories'
require 'unfuddle/people'
require 'unfuddle/tickets'

module Unfuddle
  class Client

    include Unfuddle::Config
    include Unfuddle::Connectable
    include Unfuddle::Account
    include Unfuddle::Projects
    include Unfuddle::Repositories
    include Unfuddle::People
    include Unfuddle::Tickets

    def initialize(options = {})
      Unfuddle::Config.keys.each do |key|
        instance_variable_set("@#{key}", options[key] || Unfuddle.options[key])
      end
    end

    def cache
      @cache
    end

    def credentials?
      Unfuddle::Config.keys.map do |key|
        instance_variable_get("@#{key}")
      end.all?
    end

  end
end