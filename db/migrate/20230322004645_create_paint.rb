class CreatePaint < ActiveRecord::Migration[5.2]
  def change
    create_table :paints do |t|
      t.string :name
      t.string :brand
      t.boolean :high_pressure
      t.integer :opacity
      t.datetime :created_at
      t.datetime :updated_at
      t.references :artist, foreign_key: true
    end
  end
end
