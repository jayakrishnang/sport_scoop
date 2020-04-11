class CreateMatchTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :match_teams do |t|
      t.references :match, foreign_key: true
      t.references :team, foreign_key: true
      t.integer :runs_scored, default: 0
      t.integer :balls_played, default: 0
      t.integer :runs_conceded, default: 0
      t.integer :balls_bowled, default: 0
      t.integer :outcome, default: 0

      t.timestamps
    end
  end
end
