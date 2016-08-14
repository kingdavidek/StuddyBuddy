class Section < ActiveRecord::Base
	belongs_to :piece
	has_many :subsections
end
