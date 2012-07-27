require 'unfuddle/core/version'
require 'unfuddle/response/parse_json'

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

    API_ROOT      = "/api/v1/" unless defined? API_ROOT
    API_RESPONSE  = ".json"    unless defined? API_RESPONSE

    attr_accessor *CONFIG_KEYS

    def account_root
      @account_root ||= "https://#{account}.unfuddle.com"
    end

    class << self

      def keys
        @keys ||= CONFIG_KEYS
      end

      def connection_options
        @connection_options ||= {
          headers: {
            accept: 'application/json',
            user_agent: "Unfuddle API Ruby Gem #{Unfuddle::VERSION}"
          },
          open_timeout: 5,
          raw: true,
          ssl: { verify: false },
          timeout: 10
        }
      end

      def middleware
        @middleware ||= Faraday::Builder.new(
          &Proc.new do |builder|
            builder.use Faraday::Request::UrlEncoded
            builder.use Unfuddle::Response::ParseJson
            builder.adapter Faraday.default_adapter
          end
        )
      end

    end

  end
end