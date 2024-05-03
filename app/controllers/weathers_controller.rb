class WeathersController < ApplicationController

  def index
    @weathers = Weather.page(params[:page]).per(5)
  end
end
