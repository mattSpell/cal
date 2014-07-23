require_relative '../lib/year'

RSpec.describe Year do
  context "year" do
    it "matches cal for 2013" do
      year = Year.new(2013)
      year.print_title.should == "                             2013\n\n"
    end


    # it "returns the month array" do
    #   year = Year.new(2013)
    #   year.get_year(0, 2, 2).should == nil
    # end
  end


end
