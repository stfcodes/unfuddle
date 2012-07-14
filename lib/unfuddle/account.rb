require 'unfuddle/util/date'
require 'unfuddle/config'

module Unfuddle
  module Account

    def activity(params = {})
      params = {:start_date => Unfuddle::Util.prepare_date(Date.today)}.merge params
      @connection.get do |request|
        request.url Unfuddle::Config::API_ROOT + "/account/activity" + Unfuddle::Config::API_RESPONSE
        request.params = params
      end
    end

  end
end