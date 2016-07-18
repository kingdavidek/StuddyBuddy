class CreateBooks < ActiveRecord::Migration
  def change
  	#the generator calls the create_table method, and passes the symbol :books as a parameter.
    create_table :books do |t|

      t.timestamps null: false
    end
  end
end
