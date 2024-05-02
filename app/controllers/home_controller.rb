
class HomeController < ApplicationController

  def index;end

  def create
    location = params['search']
    weather = Api::OpenWeather.current_weather(location)

    if weather["cod"] == 200
      location = Location.find_or_create_by(name: weather["name"], longitude: weather["coord"]['lon'], latitude: weather["coord"]["lat"])
    end
  end
end
