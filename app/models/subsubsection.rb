class Subsubsection < ActiveRecord::Base
	include Connectable
  	belongs_to :subsection
end
