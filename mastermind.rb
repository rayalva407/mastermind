require './player.rb'
class Mastermind
  attr_accessor :colors, :code, :guesses, :feedback

  def initialize
    @colors = %w[red green blue yellow orange purple]
    @code = []
    @guesses = []
    @feedback = []
  end

  def create_code
    @code = [@colors.sample, @colors.sample, @colors.sample, @colors.sample]
  end

  def make_guess
    guess = [@colors.sample, @colors.sample, @colors.sample, @colors.sample]

    @guesses.append(guess)

    guess
  end

  def gives_feedback(guess, code)
    feedback = []

    guess.each_with_index do |color, index|
      feedback.append("black") if color == code[index]
      feedback.append("white") if code.include?(color) && color != code[index]
    end

    feedback.append("none") if feedback.length == 0

    @feedback.append(feedback)

    feedback
  end
end

game = Mastermind.new
player = Player.new("Player 1")

game.create_code

puts "Try to break the code! You have 12 attempts."
puts "The colors are: red, green, blue, yellow, orange, purple."
puts "Example of a guess: red green blue yellow"

12.times do
  game.guesses.append(player.make_guess)

  if game.guesses.last == game.code
    puts "You win!"
    break
  else
    puts "Wrong! Try again!"
    puts "Feedback:"
    puts game.gives_feedback(game.guesses.last, game.code)
  end
end