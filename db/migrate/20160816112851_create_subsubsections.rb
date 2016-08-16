class CreateSubsubsections < ActiveRecord::Migration
  def change
    create_table :subsubsections do |t|
      t.string :name 
      t.text :broader_context
      t.text :summary
      t.text :key_questions_addressed
      t.text :thoughts
      t.references :subsection, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
