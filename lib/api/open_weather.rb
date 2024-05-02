
module Api::OpenWeather
  extend self

  def current_weather(location)
    return { error: "Location required" } if location.blank?

    client = intialize_client
    begin
      client.current_weather(city: location)
    rescue Faraday::ResourceNotFound
      {"cod"=>404, "message"=>"Weather data not found for the specified location" }
    end
  end

  private
    def intialize_client
      OpenWeather::Client.new(
        api_key: ENV['OPEN_WEATHER_KEY']
      )
    end
end
