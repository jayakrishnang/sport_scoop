class AddShortNameToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :short_name, :string, limit: 10
  end
end
