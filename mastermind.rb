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

  def makes_guess
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