require 'test_helper'

class HomeHelperTest < ActionView::TestCase

  test "meters_to_kilometers should convert meters to kilometers" do
    assert_equal 0.5, meters_to_kilometers(500)
    assert_equal 1, meters_to_kilometers(1000)
    assert_equal 2.5, meters_to_kilometers(2500)
    assert_equal 0, meters_to_kilometers(0)
  end
end
