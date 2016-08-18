class Section < ActiveRecord::Base
	include Connectable
	belongs_to :piece
	has_many :subsections
end
