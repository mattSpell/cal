require_relative 'zellers_congruence'

class Month
  MONTHS = [nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

  def initialize(month, year)
      @month = month
      @year = year
  end

  def month_header
    "#{name} #{@year}".center(20).rstrip
  end

  def name
    MONTHS[@month]
  end

  def days_in_month
    case @month
    when 4, 6, 9, 11
      30
    when 2
      if leap_year?(@year)
        29
      else
        28
      end
    else
      31
    end

  end

  def leap_year?(year)
    (year % 400 == 0) || (year % 100 != 0 && year % 4 == 0)
  end

  def get_month
    month = []
    zeller = Zeller.calculate(@month, @year)
    first_week = 8 - zeller
    day = 1

    month << []
    first_week.times do
      month[0].insert(zeller - 1, day)
      zeller += 1
      day += 1
    end
    month << []
    7.times do
      month[1] << day
      day += 1
    end
    month << []
    7.times do
      month[2] << day
      day += 1
    end
    month << []
    7.times do
      if day <= days_in_month
        month[3] << day
        day += 1
      else
        month[4] << nil
      end
    end
    month << []
    7.times do
      if day <= days_in_month
        month[4] << day
        day += 1
      else
        month[4] << nil
      end
    end
    month << []
    7.times do
      if day <= days_in_month
        month[5] << day
        day += 1
      else
        month[5] << nil
      end
    end
    month
  end

  def to_s
    output = [month_header]
    output << ["Su Mo Tu We Th Fr Sa\n"]

    get_month.map do |line|
      unless line.include?(days_in_month) || line[6] == nil
        line.map! do |index|
          if index.nil?
            index = "  "
          elsif index < 10
            index = " " + index.inspect
          end
          index
        end

      else
        line.delete_if { |index| index.nil? }
      end
      line = line.join(" ")

      output << line + "\n"
    end

    output
  end


end
