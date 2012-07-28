module Unfuddle
  module Repositories

    def repositories(repo_id = nil)
      repo_id ? get("repositories/#{repo_id}") : get("repositories")
    end

    def repository_changesets(repo_id, changeset_id = nil)
      repo_id ? get("repositories/#{repo_id}/changesets/#{changeset_id}") : get("repositories/#{repo_id}/changesets")
    end

    def latest_changeset_in_repository(repo_id)
      get("repositories/#{repo_id}/changesets/latest")
    end

    def commit_in_repository(repo_id, commit = nil)
      get("repositories/#{repo_id}/commit", {commit: commit})
    end

  end
end