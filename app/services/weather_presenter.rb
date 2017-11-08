class WeatherPresenter
  def initialize(project_id)
    @project_id = project_id
  end

  def get_forecast
    response = Faraday.get("http://api.wunderground.com/api/#{ENV['weather_api_key']}/forecast10day/q/80215.json")    

    raw_data = JSON.parse(response.body, symbolize_names: true)[:forecast][:simpleforecast][:forecastday]

    @weather = raw_data.map do |data|
      Forecast.new(data)
    end
  end

  def project
    Project.find(project_id)
  end

  private
    attr_reader :project_id
end
