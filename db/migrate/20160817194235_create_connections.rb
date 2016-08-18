class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.string :author_name
      t.text :url
      t.text :basis
      t.integer :connectable_id
      t.string :connectable_type

      t.timestamps null: false
    end
  end
end
