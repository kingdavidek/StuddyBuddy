class CreatePieces < ActiveRecord::Migration
  def change
  	#the generator calls the create_table method, and passes the symbol :books as a parameter.
    create_table :pieces do |t|
   	
    # 't' references the table that is created. It has column called timestamps, which cannot be null or empty.
      t.timestamps null: false
      t.string :name
      t.string :author
      t.string :subject
      t.text :summary
      t.string :section
      t.string :links
      t.text :references
      t.text :thoughts
      t.text :questions

    end
  end
end
