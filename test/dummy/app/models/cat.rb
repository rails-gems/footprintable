class Cat < ApplicationRecord
  include Footprintable
  has_footprint
end
