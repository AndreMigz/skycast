class WeathersController < ApplicationController

  def index
    @weathers = Weather.page(params[:page]).per(5)
  end

  def destroy
    weather = Weather.find_by(id: params[:id])
    if weather.destroy
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.remove("weather#{weather.id}")}
      end
    end
  end
end
