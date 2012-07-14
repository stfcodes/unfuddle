module Unfuddle
  module Config

    def configure
      yield self
      self
    end

    CONFIG_KEYS = [
      :account,
      :user,
      :password
    ] unless defined? CONFIG_KEYS

    attr_accessor *CONFIG_KEYS

    class << self

      def keys
        @keys ||= CONFIG_KEYS
      end

    end

  end
end