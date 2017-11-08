class WeatherService
  def ten_day_forecast(zip)
    json_parse(url(zip))[:forecast][:simpleforecast][:forecastday]
  end

  private
    def url(zip)
      Faraday.get("http://api.wunderground.com/api/#{ENV['weather_api_key']}/forecast10day/q/#{zip}.json")    
    end

    def json_parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end
