class Subsubsection < ActiveRecord::Base
	include Connectable
	include Conceptable
  	belongs_to :subsection
end
