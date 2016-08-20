class KeyConcept < ActiveRecord::Base
	belongs_to :conceptable, polymorphic: true
end
