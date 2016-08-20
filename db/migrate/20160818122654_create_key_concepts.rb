class CreateKeyConcepts < ActiveRecord::Migration
  def change
    create_table :key_concepts do |t|
      t.string :author_name
      t.text :definition
      t.text :basis
      t.text :people_attributed
      t.text :thoughts
      t.integer :conceptable_id
      t.string :conceptable_type

      t.timestamps null: false
    end
  end
end
