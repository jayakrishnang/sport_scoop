class Scheduler
  def initialize
    @match = Matches::Schedule.next_match
    @team_1, @team_2 = @match.teams.ids
  end

  def schedule
    matches = Vault.where(team_1_id: @team_1, team_2_id: @team_2).where.not(id: Match.pluck(:vault_id).compact)
    matches += Vault.where(team_2_id: @team_1, team_1_id: @team_2).where.not(id: Match.pluck(:vault_id).compact)
    @selection = matches.sample
    @match.update(url: @selection.url, vault_id: @selection.id)
  end
end
