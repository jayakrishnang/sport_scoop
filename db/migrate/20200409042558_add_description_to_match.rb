class AddDescriptionToMatch < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :description, :text
  end
end
