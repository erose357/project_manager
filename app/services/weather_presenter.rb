class WeatherPresenter
  def initialize(project_id)
    @project_id = project_id
  end

  def get_forecast
    api.ten_day_forecast(project.zip).map { |data| Forecast.new(data) }
  end

  def project
    Project.find(project_id)
  end

  private
    attr_reader :project_id

    def api
      WeatherService.new
    end
end
