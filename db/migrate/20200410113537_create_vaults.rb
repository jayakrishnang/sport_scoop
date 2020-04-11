class CreateVaults < ActiveRecord::Migration[5.2]
  def change
    create_table :vaults do |t|
      t.bigint :team_1_id
      t.bigint :team_2_id
      t.integer :team_1_score, default: 0
      t.integer :team_1_wickets, default: 0
      t.decimal :team_1_overs, precision: 10, scale: 1, default: 0
      t.decimal :team_1_run_rate, precision: 10, scale: 4, default: 0
      t.integer :team_1_extras, default: 0
      t.integer :team_2_score, default: 0
      t.integer :team_2_wickets, default: 0
      t.decimal :team_2_overs, precision: 10, scale: 1, default: 0
      t.decimal :team_2_run_rate, precision: 10, scale: 4, default: 0
      t.integer :team_2_extras, default: 0
      t.string :victory_margin
      t.jsonb :team_1_batting, default: {}
      t.jsonb :team_2_bowling, default: {}
      t.jsonb :team_2_batting, default: {}
      t.jsonb :team_1_bowling, default: {}
      t.text :raw_input

      t.timestamps
    end
  end
end
