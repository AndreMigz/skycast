
module Api::OpenWeather
  extend self

  def current_weather(location)
    return { error: "Location required" } if location.nil?

    client = intialize_client
    client.current_weather(city: location)
  end

  private
    def intialize_client
      OpenWeather::Client.new(
        api_key: ENV['OPEN_WEATHER_KEY']
      )
    end
end
