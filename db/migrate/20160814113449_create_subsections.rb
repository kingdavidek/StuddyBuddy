class CreateSubsections < ActiveRecord::Migration
  def change
    create_table :subsections do |t|
      t.string :name
      t.text :broader_context
      t.text :summary
      t.text :key_questions_addressed
      t.text :thoughts
      t.references :section, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
