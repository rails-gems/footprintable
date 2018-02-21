require 'test_helper'

class Footprintable::Test < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Footprintable
  end

  test "a cat footprints" do
    cat = Cat.create(name: 'a1')
    cat.update(name: 'a2')
    assert_equal 2, cat.footprints.count
  end

  test "a actorable" do
    cat1 = Cat.create(name: 'first')
    Footprintable::Current.actor = cat1

    cat2 = Cat.create(name: 'a1')
    cat2.update(name: 'a2')
    assert_equal cat1, cat2.footprints.last.actorable
  end
end
