# require_relative month

class Year
  def initialize(year)
    @year = year
  end

  def print_title
    "#{@year}".rjust(33) + "\n\n"
  end

  def get_year
    line_array = []
    1.upto(12) do |i|
      month = Month.new(i, @year)
      line_array << month.get_month
    end
    line_array
  end

  def get_line(start, stop, index)
    year_array = get_year
    array = []
    year_array[start..stop].each do |line|
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
    array.join(" ").insert(20, " ").insert(42, " ")
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
    5.times do |i|
      first_lines = get_line(0,2,i)
      output << first_lines + "\n"
    end
    line6 = get_line(0,2,5)
    output << line6.rstrip + "\n"
    output << header2
    output << weeks
    5.times do |i|
      second_lines = get_line(3,5,i)
      output << second_lines + "\n"
    end
    line12 = get_line(3,5,5)
    output << line12.rstrip + "\n"
    output << header3
    output << weeks
    4.times do |i|
      third_lines = get_line(6,8,i)
      output << third_lines + "\n"
    end
    line17 = get_line(6,8,4)
    output << line17.rstrip + "\n"
    line18 = get_line(6,8,5)
    output << line18.rstrip + "\n"
    output << header4
    output << weeks
    4.times do |i|
      fourth_set = get_line(9,11,i)
      output << fourth_set + "\n"
    end
    line23 = get_line(9,11,4)
    output << line23.rstrip + "\n"
    line24 = get_line(9,11,5)
    output << line24.rstrip + "\n"
    output
  end


end
