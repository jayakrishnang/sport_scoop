ActiveAdmin.register Match do

  permit_params :number, :name, :banner, :start_time, :end_time, :url, :status,
                :short_name, :winner_id, :winner, :description,
                match_teams_attributes: [:id, :team_id, :runs_scored, :balls_played, :runs_conceded,
                  :balls_bowled, :outcome]

  form partial: 'admin/matches'
end
