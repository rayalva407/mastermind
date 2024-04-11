class Mastermind
  def initialize
    @colors = %w[red green blue yellow orange purple]
    @code = []
    @guesses = []
    @feedback = []
  end

  def create_code
    puts "Choose a code of four colors separated by spaces from the following: red, green, blue, yellow, orange, purple"
    puts "Example: 'red green blue yellow' is a valid code"

    @code.append(gets.chomp.split(" "))
  end

  def make_guess
    guess = [@colors.sample, @colors.sample, @colors.sample, @colors.sample]

    @guesses.append(guess)

    guess
  end
end

game = Mastermind.new

game.create_code

12.times do
  game.make_guess
end