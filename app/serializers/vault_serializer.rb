# frozen_string_literal: true

class VaultSerializer < ActiveModel::Serializer
  attributes :id, :team_1_summary, :team_2_summary, :team_1_run_rate, :team_2_run_rate,
             :team_1_batting, :team_2_bowling, :team_2_batting, :team_1_bowling

  def team_1_batting
    JSON.parse object.team_1_batting
  end

  def team_2_bowling
    JSON.parse object.team_2_bowling
  end

  def team_2_batting
    JSON.parse object.team_2_batting
  end

  def team_1_bowling
    JSON.parse object.team_1_bowling
  end
end
