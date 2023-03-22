class CreatePaints < ActiveRecord::Migration[5.2]
  def change
    create_table :paints do |t|
      t.string :name
      t.boolean :high_pressure
      t.integer :opacity
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end
