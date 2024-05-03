class WeathersController < ApplicationController

  def index
    @weathers = Weather.all.limit(5)
  end
end
