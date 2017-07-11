class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.references :mix, foreign_key: true
      t.string :artist
      t.string :title
      t.string :link

      t.timestamps
    end
  end
end
