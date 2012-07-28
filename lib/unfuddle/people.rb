module Unfuddle
  module People

    def people(person_id = nil, params = {})
      params    = {removed: true}.merge params
      person_id ? get("people/#{person_id}", params) : get("people", params)
    end

    def people_from_project(project_id)
      get("projects/#{project_id}/people")
    end

    def current_person
      get('people/current')
    end

    def people_involvements(person_id, involvement_id = nil)
      if involvement_id
        get("people/#{person_id}/involvements/#{involvement_id}")
      else
        get("people/#{person_id}/involvements")
      end
    end

  end
end