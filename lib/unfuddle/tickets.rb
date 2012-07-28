module Unfuddle
  module Tickets

    def tickets(project_id, ticket_id_or_number = nil, by_number = true, params={})
      if ticket_id_or_number
        if by_number
          get("projects/#{project_id}/tickets/by_number/#{ticket_id_or_number}", params)
        else
          get("projects/#{project_id}/tickets/#{ticket_id_or_number}", params)
        end
      else
        get("projects/#{project_id}/tickets", params)
      end
    end

    def changesets_for_ticket(project_id, ticket_id)
      get("projects/#{project_id}/tickets/#{ticket_id}/associated_changesets")
    end

  end
end