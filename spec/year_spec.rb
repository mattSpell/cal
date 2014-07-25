require_relative '../lib/year'

RSpec.describe Year do
  context "title" do
    it "prints the title" do
      year = Year.new(2013)
      year.print_title.should == "                             2013\n\n"
    end
  end

  context "get_year" do
    it "returns an array with 12 array months in it" do
      year = Year.new(2013)
      year.get_year.should == [[[nil, nil, 1, 2, 3, 4, 5],
      [6, 7, 8, 9, 10, 11, 12], [13, 14, 15, 16, 17, 18, 19],
      [20, 21, 22, 23, 24, 25, 26], [27, 28, 29, 30, 31, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil]],
      [[nil, nil, nil, nil, nil, 1, 2], [3, 4, 5, 6, 7, 8, 9],
      [10, 11, 12, 13, 14, 15, 16], [17, 18, 19, 20, 21, 22, 23],
      [24, 25, 26, 27, 28, nil, nil], [nil, nil, nil, nil, nil, nil, nil]],
      [[nil, nil, nil, nil, nil, 1, 2], [3, 4, 5, 6, 7, 8, 9],
      [10, 11, 12, 13, 14, 15, 16], [17, 18, 19, 20, 21, 22, 23],
      [24, 25, 26, 27, 28, 29, 30], [31, nil, nil, nil, nil, nil, nil]],
      [[nil, 1, 2, 3, 4, 5, 6], [7, 8, 9, 10, 11, 12, 13],
      [14, 15, 16, 17, 18, 19, 20], [21, 22, 23, 24, 25, 26, 27],
      [28, 29, 30, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil, nil]],
      [[nil, nil, nil, 1, 2, 3, 4], [5, 6, 7, 8, 9, 10, 11],
      [12, 13, 14, 15, 16, 17, 18], [19, 20, 21, 22, 23, 24, 25],
      [26, 27, 28, 29, 30, 31, nil], [nil, nil, nil, nil, nil, nil, nil]],
      [[nil, nil, nil, nil, nil, nil, 1], [2, 3, 4, 5, 6, 7, 8],
      [9, 10, 11, 12, 13, 14, 15], [16, 17, 18, 19, 20, 21, 22],
      [23, 24, 25, 26, 27, 28, 29], [30, nil, nil, nil, nil, nil, nil]],
      [[nil, 1, 2, 3, 4, 5, 6], [7, 8, 9, 10, 11, 12, 13], [14, 15, 16, 17, 18, 19, 20],
      [21, 22, 23, 24, 25, 26, 27], [28, 29, 30, 31, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil]], [[nil, nil, nil, nil, 1, 2, 3],
      [4, 5, 6, 7, 8, 9, 10], [11, 12, 13, 14, 15, 16, 17],
      [18, 19, 20, 21, 22, 23, 24], [25, 26, 27, 28, 29, 30, 31],
      [nil, nil, nil, nil, nil, nil, nil]], [[1, 2, 3, 4, 5, 6, 7],
      [8, 9, 10, 11, 12, 13, 14], [15, 16, 17, 18, 19, 20, 21],
      [22, 23, 24, 25, 26, 27, 28], [29, 30, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil]], [[nil, nil, 1, 2, 3, 4, 5],
      [6, 7, 8, 9, 10, 11, 12], [13, 14, 15, 16, 17, 18, 19], [20, 21, 22, 23, 24, 25, 26],
      [27, 28, 29, 30, 31, nil, nil], [nil, nil, nil, nil, nil, nil, nil]],
      [[nil, nil, nil, nil, nil, 1, 2], [3, 4, 5, 6, 7, 8, 9], [10, 11, 12, 13, 14, 15, 16],
      [17, 18, 19, 20, 21, 22, 23], [24, 25, 26, 27, 28, 29, 30], [nil, nil, nil, nil, nil, nil, nil]],
      [[1, 2, 3, 4, 5, 6, 7], [8, 9, 10, 11, 12, 13, 14], [15, 16, 17, 18, 19, 20, 21],
      [22, 23, 24, 25, 26, 27, 28], [29, 30, 31, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil]]]
    end
  end

  context "get line" do
    it "returns the correct line" do
      year = Year.new(2013)
      year.get_line(0,2,0).should == "       1  2  3  4  5                  1  2                  1  2"
    end
    it "returns the correct line" do
      year = Year.new(1940)
      year.get_line(0,2,0).should == "    1  2  3  4  5  6               1  2  3                  1  2"
    end
  end

end
