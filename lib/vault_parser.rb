class VaultParser
  def initialize(vault)
    @vault = vault
    @input = vault.raw_input.gsub("\r", '')
    @indexes = { summary: 24 }
  end

  def parse
    @vault.team_1 = find_team(@input.split("\n")[0])
    @vault.team_2 = find_team(@input.split("\n")[3])
    @vault.victory_margin = find_margin(@input.split("\n")[6])
    @vault.team_1_batting = scan_team_1_batting
    @vault.team_1_score, @vault.team_1_wickets, @vault.team_1_overs, @vault.team_1_run_rate = find_totals
    @vault.team_1_extras = find_extras
    @vault.team_2_bowling = scan_team_2_bowling
    @vault.team_2_batting = scan_team_2_batting
    @vault.team_2_score, @vault.team_2_wickets, @vault.team_2_overs, @vault.team_2_run_rate = find_totals(@indexes.values.sum - 10)
    @vault.team_2_extras = find_extras(@indexes.values.sum - 10)
    @vault.team_1_bowling = scan_team_1_bowling
    @vault.save
  end

  private

  def find_team(line)
    line = 'Delhi Capitals' if line == 'Delhi Daredevils'
    Team.find_by(name: line)
  end

  def find_margin(line)
    line.split(' won by ').last
  end

  def scan_batting(lines)
    lines = lines.drop(6).in_groups_of(7)
    lines.pop
    lines.to_json
  end

  def scan_team_1_batting
    lines = @input.match(/BATSMEN.*?Extras/m).to_a.first.split("\n")
    @indexes[:batting_1] = lines.length - 1
    scan_batting(lines)
  end

  def scan_team_2_batting
    input = @input.split("\n").drop(@indexes.values.sum).join("\n")
    lines = input.match(/BATSMEN.*?Extras/m).to_a.first.split("\n")
    @indexes[:batting_2] = lines.length - 1
    scan_batting(lines)
  end

  def scan_bowling(lines)
    lines = lines.map do |line|
      line = line.split(' ').compact
      line[1] = line[0] + ' ' + line[1]
      line.drop(1)
    end
    lines.to_json
  end

  def scan_team_2_bowling
    lines = @input.match(/BOWLING.*?BATSMEN/m).to_a.first.split("\n")
    @indexes[:bowling_2] = lines.length - 1
    lines = lines.in_groups_of(7).flatten.compact
    lines = lines.drop(1)
    lines.pop(2)
    scan_bowling(lines)
  end

  def scan_team_1_bowling
    input = @input.split("\n").drop(@indexes.values.sum).join("\n")
    lines = input.match(/BOWLING.*/m).to_a.first.split("\n")
    lines = lines.in_groups_of(7).flatten.compact
    lines = lines.drop(1)
    scan_bowling(lines)
  end

  def find_totals(offset = nil)
    input = @input
    input = @input.split("\n").drop(offset).join("\n") if offset.present?

    line = input.match(/TOTAL.*?\)/m).to_a.first.split("\n").second
    score = line.split('/').first.to_i
    line = line.split('/').last
    wickets = line.split(' ').first.to_i
    overs = line.split(' ').second.split('(').last.to_f
    run_rate = line.split(' ').last.split(')').last.to_f
    [score, wickets, overs, run_rate]
  end

  def find_extras(offset = nil)
    input = @input
    input = @input.split("\n").drop(offset).join("\n") if offset.present?

    line = input.match(/Extras.*?\)/m).to_a.first.split("\n").second
    line.split(' ').first.to_i
  end
end
