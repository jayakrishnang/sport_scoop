class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :wins, default: 0
      t.integer :losses, default: 0
      t.integer :no_results, default: 0
      t.decimal :net_run_rate, default: 0

      t.timestamps
    end
  end
end
