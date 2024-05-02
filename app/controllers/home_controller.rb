
class HomeController < ApplicationController

  def index;end

  def create
    location = search_params[:search]
    forecast = Api::OpenWeather.current_weather(location)

    if forecast["cod"] == 200
      location = Location.find_or_create_by(name: forecast["name"], longitude: forecast["coord"]['lon'], latitude: forecast["coord"]["lat"])
      return unless location
      weather = location.weather_forecast.new(
        main: forecast["weather"][0]["main"],
        temperature: forecast["main"]["temp"],
        wind_speed: forecast["wind"]["speed"],
        humidity: forecast["main"]["humidity"],
        real_feel: forecast["main"]["feels_like"],
        cloudiness: forecast["clouds"]["all"],
        pressure: forecast["main"]["pressure"],
        visibility: forecast["visibility"],
        max_temperature: forecast["main"]["temp_max"],
        min_temperature: forecast["main"]["temp_min"],
        sunrise: Time.at(forecast["sys"]["sunrise"]),
        sunset: Time.at(forecast["sys"]["sunset"])
      )
      weather.save
    end
  end

  private
    def search_params
      params.permit(:search)
    end
end
