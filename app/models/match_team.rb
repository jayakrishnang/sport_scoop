class MatchTeam < ApplicationRecord
  belongs_to :match
  belongs_to :team

  enum outcome: { scheduled: 0, won: 1, lost: 2, no_result: 3 }
end
