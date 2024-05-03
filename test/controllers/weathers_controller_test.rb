require "test_helper"

class WeathersControllerTest < ActionDispatch::IntegrationTest

   test '#index should be able to access the root_path' do
    get weathers_path
    assert_response :success
  end

  test '#destroy should be able to delete weather logs' do
    weather = weathers(:one)
    assert_difference('Weather.count', -1) do
      delete weather_path(weather), params: { id: weather.id}
    end
  end
end
