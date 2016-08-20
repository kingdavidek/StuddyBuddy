module Conceptable
  extend ActiveSupport::Concern

  included do
    has_many :key_concepts, as: :conceptable
  end
end
