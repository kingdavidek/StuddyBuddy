class Piece < ActiveRecord::Base
	has_many :sections
end


#Rails queries the database, looks at the pieces table, and assumes that whatever columns that table has should be the attributes for the model.
