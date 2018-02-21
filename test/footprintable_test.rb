require 'test_helper'

class Footprintable::Test < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Footprintable
  end

  test "a cat footprints" do
    cat = Cat.create(name: 'a1')
    cat.update(name: 'a2')
    p cat.footprints
    assert_equal 2, cat.footprints.count
  end
end
