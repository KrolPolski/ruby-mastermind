require_relative 'board'
require 'colorize'

class Mastermind
  def initialize
    @board = Board.new('RBBY')
    puts 'Welcome to Mastermind.'.blue
    launch
  end
  def launch
    puts "\nDo you want to read the instructions before you play? [Y/N]"
    input = gets.chomp
    if input.upcase == 'Y' || input.upcase == 'YES'
      instructions
      new_game
    elsif input.upcase == 'N' || input.upcase == 'NO'
      puts "Okay let's just play"
      new_game
    else
      puts "I hope you know what you are doing..."
      new_game
    end
  end

  def instructions
    puts "\nINSTRUCTIONS: "
    puts "\nYour objective is to guess a secret sequence of four colored pegs, in 12 guesses or less. Each square represents a peg."
    puts "\nRules:"
    puts '1) The secret sequence is made up of only Red, Green, Blue or Yellow.'
    puts '2) a color may be repeated in the sequence as many times as desired.'
    puts "\n You will be prompted to enter a guess as a string of exactly four characters, like so:"
    puts 'Guess: BBBB'
    @board.make_guess('BBBB')
    puts "\nThe result gives you feedback on your guess as follows:"
    puts "\n1) Each red result peg means you have one peg of the correct color in the correct position."
    puts '2) Each white result peg means you have one peg of a correct color in an incorrect position.'
    puts '3) The result positions do not correlate to specific guess positions, they merely tell you how many you have correct or nearly correct.'
    puts "\nSo in our example, we know that two of the pegs are blue, but we don't know which ones are right."
    puts 'Each guess gives you more feedback and enables you to make better guesses.'
    puts 'Guess: BBGG'
    @board.make_guess('BBGG')
    puts "\nSo now you would know that one of the blue pegs is in the first two positions, and one of them is elsewhere."
    puts 'And you could conclude that there are no green pegs since the number of result pegs did not change.'
    puts "\nIf you identify the correct pattern in 12 guesses or less, you win!"
  end

  def validate_input(guess)
    options = ['R', 'G', 'B', 'Y']
    if guess.length != 4
      return false
    end
    guess.each_char do |c|
      if options.count(c) != 1
        return false
      end  
    end
    true
  end

  def new_game
    puts "\nLet's begin! Please enter a four character string, using only the letters R, G, B, or Y, with no spaces 'RGBY' for example\n\n"
    options = ['R', 'G', 'B', 'Y']
    secret_code = Array.new(4) { options.sample }
    secret_code = secret_code.join
    @board = Board.new(secret_code)
    attempts = 0
    game_over = false
    while (attempts <= 12 && !game_over)
      print "Guess: "
      input = gets.chomp
      input = input.upcase
      if validate_input(input) == false
        puts "That's not a valid guess. You need exactly four characters, made up only of R, G, B, or Y"
      else
        game_over = @board.make_guess(input)
        attempts += 1
      end
    end
    if (!game_over)
      puts "\nYou lose! The secret code was: #{secret_code}".red
    else
      puts "\nYou won in #{attempts} guesses out of 12! Congratulations!"
    end
    
    puts "Do you want to play again? [Y/N]"
    input = gets.chomp
    if input.upcase == 'Y'
      new_game
    else
      puts "Goodbye! Don't forget to tip your developer!".yellow
    end
  end
end

Mastermind.new
