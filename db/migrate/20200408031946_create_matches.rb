class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.string :number, default: 1
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.string :url
      t.integer :status, default: 0
      t.bigint :winner_id

      t.timestamps
    end
  end
end
