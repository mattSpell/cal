class Zeller
  #["Sa", "Su", "Mo", "Tu", "We", "Th", "Fr"]
  DAYS = [7, 1, 2, 3, 4, 5, 6]
  def self.calculate(month, year)

    case month
    when 1
      month = 13
      year -= 1
    when 2
      month = 14
      year -= 1
    end

    week_day = (1 + ((26*(month + 1)) /10).floor + year + (year/4).floor + 6 * (year/100).floor + (year/400).floor) % 7

    return DAYS[week_day]
  end
end
