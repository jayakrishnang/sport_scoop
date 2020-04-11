class AddShortNameToMatch < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :short_name, :string
  end
end
