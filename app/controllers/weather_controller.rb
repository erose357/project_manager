class WeatherController < ApplicationController
  def index
    @weather = WeatherPresenter.new(params[:project_id])
  end
end
