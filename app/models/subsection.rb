class Subsection < ActiveRecord::Base
	include Connectable
  	belongs_to :section
  	has_many :subsubsections
end
 