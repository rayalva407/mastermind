require_relative 'mastermind'
require_relative 'player'

game = Mastermind.new
player = Player.new("Player 1")
i = 0
choice = ""

puts "Welcome to Mastermind!"
puts "Would you like to create the code or break the code? 1 for create 2 for break."

while choice != "1" && choice != "2"
  choice = gets.chomp
end

puts

if choice == "1"
  puts "Create the code!"
  puts "The colors are: red, green, blue, yellow, orange, purple."
  puts "Example of a code: 'red green blue yellow'"
  puts

  game.code = player.inputs_code
  puts "The code has been created!"
  puts "I will try to break the code"

  while i < 12

    game.makes_guess

    if game.guesses.last == game.code
      puts "I broke the code! I win!"
      puts
      break
    else
      puts "I got it wrong! I will try again!"
      puts "Feedback:"
      puts game.gives_feedback(game.guesses.last, game.code)
      puts

      i += 1

      if i == 12
        puts "I could not break the code! You win!"
        puts
        break
      end
    end
  end
else
  puts "Creating the code..."
  game.create_code
  puts "Try to break the code! You have 12 attempts."
  puts "The colors are: red, green, blue, yellow, orange, purple."
  puts "Example of a guess: 'red green blue yellow'"
  puts

  while i < 12

    puts "Input your guess:"

    game.guesses.append(player.inputs_code)

    if game.guesses.last == game.code
      puts "You win!"
      puts
      break
    else
      puts "Wrong! Try again!"
      puts "Feedback:"
      puts game.gives_feedback(game.guesses.last, game.code)
      puts

      i += 1

      if i == 12
        puts "You lose!"
        puts
        break
      end
    end
  end
end



