class Forecast
  attr_reader :high, :low, :conditions, :icon_url, :weekday
  def initialize(attrs)
    @location   = attrs[:date][:tz_long]
    @weekday    = attrs[:date][:weekday]
    @day        = attrs[:date][:day]
    @month      = attrs[:date][:month]
    @year       = attrs[:date][:year]
    @high       = attrs[:high][:fahrenheit]
    @low        = attrs[:low][:fahrenheit]
    @conditions = attrs[:conditions]
    @icon       = attrs[:icon]
    @icon_url   = attrs[:icon_url]
  end

  def date
    "#{month}/#{day}/#{year}"
  end

  def city
    location.split('/')[1]
  end

  private
    attr_reader :month, :day, :year, :location
end
