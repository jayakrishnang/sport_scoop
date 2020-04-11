class AddVaultIdToMatches < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :vault_id, :bigint
  end
end
