class Year
  def initialize(year)
    if year < 1800 || year >= 3001
      puts "cal: #{year} must be in range (1800..3000)"
      exit
    end
    @year = year
    @year_array = get_year
    @mar_length = 0
    @june_length = 0
    @sept_length = 0
    @dec_length = 0
  end

  def print_title
    "#{@year}".rjust(33) + "\n\n"
  end

  def get_year
    line_array = []
    1.upto(12) do |i|
      month = Month.new(i, @year)
      case i
      when 3
        @mar_length = month.days_in_month
      when 6
        @june_length = month.days_in_month
      when 9
        @sept_length = month.days_in_month
      when 12
        @dec_length = month.days_in_month
      end
      line_array << month.get_month
    end
    line_array
  end

  def get_line(start, stop, index)
    array = []
    @year_array[start..stop].each do |line|
      array << line[index]
    end
    array = array.flatten
    array.map! do |i|
      if i.nil?
        i = "  "
      elsif i.to_i < 10
        i = " " + i.to_s
      end
      i
    end
    last_day = array[-1].to_i
    if last_day = @mar_length || last_day = @june_length || last_day = @sept_length || last_day = @dec_length
      array.join(" ").insert(20, " ").insert(42, " ").rstrip
    else
      array.join(" ").insert(20, " ").insert(42, " ")
    end
  end

  def to_s
    header = ["      January               February               March\n",
      "       April                  May                   June\n",
      "        July                 August              September\n",
      "      October               November              December\n"]
    weeks = "Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n"
    output = print_title
    inputs = [[0, 2], [3, 5], [6, 8], [9, 11]]
    inputs.each_with_index { |qtr, i|
      output << header[i]
      output << weeks
      6.times do |j|
        line = get_line(qtr[0], qtr[1], j) + "\n"
        output << line
      end
    }
    output
  end
end
