# require_relative 'month'

class Year
  def initialize(year)
    @year = year
    @year_array = get_year
    @march_length = 0
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
        @march_length = month.days_in_month
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
    stuff = array[-1].to_i
    if stuff = @march_length || stuff = @june_length || stuff = @sept_length || stuff = @dec_length
      array.join(" ").insert(20, " ").insert(42, " ").rstrip
    else
      array.join(" ").insert(20, " ").insert(42, " ")
    end
  end

  def to_s
    header1 = "      January               February               March\n"
    header2 = "       April                  May                   June\n"
    header3 = "        July                 August              September\n"
    header4 = "      October               November              December\n"
    weeks = "Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n"
    output = print_title
    output << header1
    output << weeks
    6.times do |i|
      first_lines = get_line(0,2,i)
      output << first_lines + "\n"
    end
    output << header2
    output << weeks
    6.times do |i|
      second_lines = get_line(3,5,i)
      output << second_lines + "\n"
    end
    output << header3
    output << weeks
    6.times do |i|
      third_lines = get_line(6,8,i)
      output << third_lines + "\n"
    end
    output << header4
    output << weeks
    6.times do |i|
      fourth_set = get_line(9,11,i)
      output << fourth_set + "\n"
    end
    output
  end
end
