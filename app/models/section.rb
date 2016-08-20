class Section < ActiveRecord::Base
	include Connectable
	include Conceptable
	belongs_to :piece
	has_many :subsections
end
