class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :author_name
      t.text :url
      t.text :basis
      t.references :piece, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
