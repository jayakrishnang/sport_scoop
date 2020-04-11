class AddVictoryMarginToMatches < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :victory_margin, :string
  end
end
