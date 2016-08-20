class Subsection < ActiveRecord::Base
	include Connectable
	include Conceptable
  	belongs_to :section
  	has_many :subsubsections
end
 