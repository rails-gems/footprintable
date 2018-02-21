require 'test_helper'

class Footprintable::Test < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Footprintable
  end
end
