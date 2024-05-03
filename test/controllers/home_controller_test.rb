require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest

  setup do
    # Stub API request to avoid sending API request while running tests
    @mock_response = mock_response
    client = Api::OpenWeather
    client.stubs(:current_weather).returns(@mock_response)
    @search_input = "Manila"
  end

  test '#index should be able to access the root_path' do
    get root_path
    assert_response :success
  end

  test '#create should be able to create location and weather records after a successful API request' do
    assert_difference 'Location.count' do
      assert_difference 'Weather.count' do
        post home_index_path, params: {search: @search_input}
      end
    end
  end

    test '#create should not be able to create location and weather records if there is no search input' do
    assert_difference 'Location.count' do
      assert_difference 'Weather.count' do
        post home_index_path, params: {search: nil}
      end
    end
  end

  test '#create should not create a new record for location if there is an existing record for the same location' do
    existing_location = Location.create(name: mock_response['name'], longitude: mock_response["coord"]['lon'], latitude: mock_response["coord"]["lat"])

    assert_no_difference 'Location.count' do
      post home_index_path, params: {search: @search_input}
    end
    assert_equal existing_location.name, mock_response['name']
    assert_equal existing_location.longitude, mock_response["coord"]['lon']
    assert_equal existing_location.latitude, mock_response["coord"]["lat"]
  end

  private
    def mock_response
      {
        "coord" => {"lon" => 120.9822, "lat" => 14.6042},
        "weather" => [
          {
            "main" => "Clouds",
            "description" => "few clouds"
          }
        ],
        "main" => {"temp" => 302.76, "feels_like" => 307.48, "temp_min" => 302.07, "temp_max" => 303.15, "pressure" => 1011, "humidity" => 71},
        "visibility" => 10000,
        "wind" => {"speed" => 4.12, "deg" => 110},
        "clouds" => {"all" => 20},
        "dt" => "2024-05-02 16:09:24 UTC",
        "sys" => {"type" => 2, "id" => 2008256, "country" => "PH", "sunrise" => DateTime.parse("2024-05-02 16:09:24 UTC"), "sunset" => DateTime.parse("2024-05-03 10:13:16 UTC")},
        "timezone" => 28800,
        "name" => "Manila",
        "cod" => 200
      }
    end
end
