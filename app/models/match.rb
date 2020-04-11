class Match < ApplicationRecord
  has_one_attached :banner
  has_one :winner, class_name: 'Team', foreign_key: :winner_id
  has_many :match_teams
  has_many :teams, through: :match_teams
  belongs_to :vault, optional: true

  enum status: { scheduled: 0, ongoing: 1, completed: 2 }

  accepts_nested_attributes_for :match_teams

  def team_1
    teams.first
  end

  def team_2
    teams.last
  end

  def loser
  	return unless self.completed?

  	self.match_teams.where.not(team_id: self.winner_id).first.team
  end

  def summary_message
    unless self.completed?
      return "#{self.match_teams.first.team.short_name} beat #{self.match_teams.last.team.short_name} by #{(1..50).to_a.sample} runs"
    end

    return unless self.completed?

    "#{self.winner.short_name} beat #{self.loser.short_name} by #{self.victory_margin}"
  end

  def summary
    unless self.completed?
      info = [
        "#{self.teams.first.short_name}: #{(1..200).to_a.sample}/#{(1..10).to_a.sample}",
        "#{self.teams.last.short_name}: #{(1..200).to_a.sample}/#{(1..10).to_a.sample}"
      ]
      return info
    end

    return unless self.completed?
  end
end
