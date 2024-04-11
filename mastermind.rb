class Mastermind
  def initialize
    @code = []
    @guesses = []
    @feedback = []
  end

  def create_code
    puts "Choose a code of four colors separated by spaces from the following: red, green, blue, yellow, orange, purple"
    puts "Example: 'red green blue yellow' is a valid code"

    @code.append(gets.chomp.split(" "))
  end
end

game = Mastermind.new

game.choose_code