module Connectable
  extend ActiveSupport::Concern

  included do
    has_many :connections, as: :connectable
  end
end
