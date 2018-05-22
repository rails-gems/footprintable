class Cat < ApplicationRecord
  include Footprintable
  has_footprints
end
