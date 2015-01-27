class TipCalculator
  attr_accessor :bill, :tip_percent, :num_people
 
  attr_reader :total, :my_share
 
  def initialize
    # Collect user input 
    get_bill
    get_tip_percent
    get_num_people
  end
 
  def start
    puts "-"*8
    calculate_total
    calculate_my_share
  end
 
  def calculate_total
    @total = @bill * (1 + (@tip_percent/100.00))
    puts "The total bill is:\t$#{@total}"
  end
 
  def calculate_my_share
    @my_share = @total / @num_people
    puts "My share of the bill:\t$#{@total}"
  end
 
  def get_bill
    @bill = get_float "Please enter a bill amount:"
  end
 
  def get_tip_percent
    @tip_percent = get_float "Please enter a tip percent:"
  end
 
  def get_num_people
    @num_people = get_float "Please enter a dinner party size:"
  end
 
  private
  def get_float(request)
    puts request
    gets.to_f
  end	
 
end
 
 
tip_calc = TipCalculator.new
tip_calc.start
 
#Outputs tip total and user share
puts tip_calc.total, tip_calc.my_share
