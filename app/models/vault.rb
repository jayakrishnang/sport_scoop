class Vault < ApplicationRecord
	include Vault::Parser

	belongs_to :team_1, class_name: 'Team', foreign_key: :team_1_id, optional: true
	belongs_to :team_2, class_name: 'Team', foreign_key: :team_2_id, optional: true

	after_create :parse

	def team_1_summary
		"#{team_1_score}/#{team_1_wickets} from #{team_1_overs} overs"
	end

	def team_2_summary
		"#{team_2_score}/#{team_2_wickets} from #{team_2_overs} overs"
	end
end
