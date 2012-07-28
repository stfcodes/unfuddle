require 'unfuddle/util/date'

module Unfuddle
  module Projects

    def projects(project_id = nil)
      project_id ? get("projects/#{project_id}") : get("projects")
    end

    def projects_by_short_name(short_name)
      get("projects/by_short_name/#{short_name}")
    end

    def project_activity(project_id, params = {})
      Unfuddle::Util.prepare_date(params[:start_date] ) if params[:start_date]
      params = {:start_date => Unfuddle::Util.prepare_date(Date.today)}.merge params
      get("projects/#{project_id}/activity", params)
    end

    def project_search(project_id, params={})
      params[:filter] = if params[:filter]
        params[:filter].join(",")                 if params[:filter].is_a? Array
        params[:filter].split(/[^\w]+/).join(',') if params[:filter].is_a? String
      end

      get("projects/#{project_id}/search", params)
    end

    def project_involvements(project_id, involvement_id = nil)
      if involvement_id
        get("projects/#{project_id}/involvements/#{involvement_id}")
      else
        get("projects/#{project_id}/involvements")
      end
    end

  end
end