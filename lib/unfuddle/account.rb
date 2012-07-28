require 'unfuddle/util/date'

module Unfuddle
  module Account

    def account_info
      get("account")
    end

    # The activity for all Projects to which the requesting person has access.
    # If no dates are given, activity for the last two weeks is returned.

    # params = [:start_date, :end_date, :limit]
    def activity(params = {})
      Unfuddle::Util.prepare_date(params[:start_date] ) if params[:start_date]
      params = {start_date: Unfuddle::Util.prepare_date(Date.today)}.merge params

      get("account/activity", params)
    end


    # Searches through all projects to which the requester person has access for
    # instances of the given query string.

    # params = [:query, :start_index, :end_index, :limit, :filter]
    def account_search(params={})
      params[:filter] = if params[:filter]
        params[:filter].join(",")                 if params[:filter].is_a? Array
        params[:filter].split(/[^\w]+/).join(',') if params[:filter].is_a? String
      end

      get("account/search", params)
    end

    # A convenience resource that provides many of the top level items in
    # an account in a single call.
    def initializer
      get("initializer")
    end

  end
end