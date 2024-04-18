class Player
  attr_reader :name, :score

  def initialize(name)
    @name = name
  end

  def make_guess
    gets.chomp.split(" ")
  end
end