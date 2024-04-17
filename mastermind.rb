class Mastermind
  attr_accessor :colors, :code, :guesses, :feedback

  def initialize
    @colors = %w[red green blue yellow orange purple]
    @code = []
    @guesses = []
    @feedback = []
  end

  def create_code
    puts "Choose a code of four colors separated by spaces from the following: red, green, blue, yellow, orange, purple"
    puts "Example: 'red green blue yellow' is a valid code"

    @code = gets.chomp.split(" ")
  end

  def make_guess
    guess = [@colors.sample, @colors.sample, @colors.sample, @colors.sample]

    @guesses.append(guess)

    guess
  end

  def gives_feedback(guess, code)
    feedback = []

    guess.each_with_index do |color, index|
      if color == code[index]
        feedback.append("black")
      elsif code.include?(color)
        feedback.append("white")
      end
    end

    @feedback.append(feedback)

    feedback
  end
end

game = Mastermind.new

game.create_code

12.times do
  game.make_guess

  if game.guesses.last == game.code
    puts "You win!"
    break
  else
    puts "Try again!"
    game.gives_feedback(game.guesses.last, game.code)
  end
end