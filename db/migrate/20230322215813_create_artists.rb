class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.boolean :sponsored
      t.integer :rank

      t.timestamps
    end
  end
end
