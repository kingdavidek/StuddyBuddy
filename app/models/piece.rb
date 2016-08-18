class Piece < ActiveRecord::Base
	include Connectable
	has_many :sections
	has_many :subsections, through: :sections
	has_many :links
end


#Rails queries the database, looks at the pieces table, and assumes that whatever columns that table has should be the attributes for the model.
