require 'test_helper'

class HomeHelperTest < ActionView::TestCase

  test "weather_icon should return correct image path" do
    assert_equal "thunderstorm.png", weather_icon("Thunderstorm")
    assert_equal "rain.png", weather_icon("Rain")
    assert_equal "clouds.png", weather_icon("Clouds")
    assert_equal "drizzle.png", weather_icon("Drizzle")
    assert_equal "snow.png", weather_icon("Snow")
    assert_equal "mist.png", weather_icon("Mist")
    assert_equal "clear.png", weather_icon("Clear")
    assert_equal "clear.png", weather_icon("Unknown")
  end

  test "meters_to_kilometers should convert meters to kilometers" do
    assert_equal 0.5, meters_to_kilometers(500)
    assert_equal 1, meters_to_kilometers(1000)
    assert_equal 2.5, meters_to_kilometers(2500)
    assert_equal 0, meters_to_kilometers(0)
  end
end
