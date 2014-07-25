RSpec.describe "Cal's full month integration" do
  it "should correctly print July 2017" do
    expected = <<EOS
     July 2017
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31
EOS
    actual = `./cal 07 2017`
    actual.should == expected
  end

  it "should correctly print December 2013 - starts on Sunday" do
    expected = <<EOS
   December 2013
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
    actual = `./cal 12 2013`
    actual.should == expected
  end

  it "should correctly print Feb 2009 - 4 weeks" do
    expected = <<EOS
   February 2009
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28


EOS
    actual = `./cal 2 2009`
    actual.should == expected
  end

  it "should correctly print Jan 2013" do
    expected = <<EOS
    January 2013
Su Mo Tu We Th Fr Sa
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29 30 31

EOS
    actual = `./cal 1 2013`
    actual.should == expected
  end

  it "should correctly print Jan 2016 - 6 weeks" do
    expected = <<EOS
    January 2016
Su Mo Tu We Th Fr Sa
                1  2
 3  4  5  6  7  8  9
10 11 12 13 14 15 16
17 18 19 20 21 22 23
24 25 26 27 28 29 30
31
EOS
    actual = `./cal 1 2016`
    actual.should == expected
  end

end
