class Player
  attr_reader :name, :score

  def initialize(name)
    @name = name
  end

  def inputs_code
    gets.chomp.split(" ")
  end

end