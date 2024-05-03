module ApplicationHelper

    def weather_icon(forecast_main)
    case forecast_main.downcase
    when "thunderstorm"
      "thunderstorm.png"
    when "rain"
      "rain.png"
    when "clouds"
      "clouds.png"
    when "drizzle"
      "drizzle.png"
    when "snow"
      "snow.png"
    when "mist"
      "mist.png"
    else
      "clear.png"
    end
  end
end
