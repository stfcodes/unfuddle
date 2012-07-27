require 'faraday'
require 'unfuddle/core/config'

module Unfuddle
  module Connectable

    def delete(path, params = {})
      request(:delete, path, params)
    end

    def get(path, params = {})
      request(:get, path, params)
    end

    def post(path, params = {})
      request(:post, path, params)
    end

    def put(path, params = {})
      request(:put, path, params)
    end

    private

      def connection
        @connection ||= Faraday.new(self.account_root, Unfuddle::Config.connection_options.merge(builder: Unfuddle::Config.middleware))
      end

      def authorization
        @authorization ||= connection.basic_auth(self.user, self.password)
      end

      def request(method, endpoint, params = {})
        uri = Unfuddle::Config::API_ROOT
        uri += endpoint
        uri += Unfuddle::Config::API_RESPONSE

        request_headers = {}
        if credentials?
          request_headers[:authorization] = authorization
        else
          raise 'You need to authenticate first!'
        end

        response = connection.run_request(method.to_sym, endpoint, nil, request_headers) do |request|
          unless params.empty?
            case request.method
            when :post, :put
              request.body = params
            else
              request.params.update(params)
            end
          end
          yield request if block_given?
        end.env

        response
      end

  end
end