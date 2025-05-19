require_relative 'board'

class Mastermind
  # def random_code
  #   return [RED, GRN, BLU, YEL]
  # end
  def initialize
    @board = Board.new('RBBY')
    new_game
  end

  def instructions
    puts 'INSTRUCTIONS: '
    puts "\nYour objective is to guess a secret sequence of four colored pegs, in 12 guesses or less. Each square represents a peg."
    puts "\nRules:"
    puts '1) The secret sequence is made up of only Red, Green, Blue or Yellow.'
    puts '2) a color may be repeated in the sequence as many times as desired.'
    puts "\n You will be prompted to enter a guess as a string of exactly four characters, like so:"
    puts 'Guess: BBBB'
    @board.make_guess('BBBB')
    #@board.print_result('RR')
    puts "\nThe result gives you feedback on your guess as follows:"
    puts "\n1) Each red result peg means you have one peg of the correct color in the correct position."
    puts '2) Each white result peg means you have one peg of a correct color in an incorrect position.'
    puts '3) The result positions do not correlate to specific guess positions, they merely tell you how many you have correct or nearly correct.'
    puts "\nSo in our example, we know that two of the pegs are blue, but we don't know which ones are right."
    puts 'Each guess gives you more feedback and enables you to make better guesses.'
    puts 'Guess: BBGG'
    @board.make_guess('BBGG')
   # @board.print_result('RW')
    puts "\nSo now you would know that one of the blue pegs is in the first two positions, and one of them is elsewhere."
    puts 'And you could conclude that there are no green pegs since the number of result pegs did not change.'
    puts "\nIf you identify the correct pattern in 12 guesses or less, you win!"
  end

  def new_game
    puts 'Welcome to Mastermind.'
    puts 'Do you want to read the instructions before you play? [Y/N]'
    input = gets.chomp
    if input.upcase == 'Y'
      instructions
    elsif input.upcase == 'N'
      puts "Okay let's just play"
    else
      puts 'WTF dude'
    end
    @board.reset_board
    @board.make_guess('GGGG')
  end
end

Mastermind.new
