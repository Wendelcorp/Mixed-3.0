class CreateMixes < ActiveRecord::Migration[5.0]
  def change
    create_table :mixes do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
