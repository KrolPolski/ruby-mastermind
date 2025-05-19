require 'colorize'

class Board
  def initialize(secret_code)
    @secret_code = secret_code
    @attempts = 0
    @box = '  '
    @guess_hash = { 'R': @box.on_red, 'B': @box.on_blue, 'G': @box.on_green, 'Y': @box.on_light_yellow }
    @result_hash = { 'R': @box.on_red, 'W': @box.on_white }
    @guesses_log = []
	@result_log = []
	@result_str = ''
  end

  def reset_board
    @guesses_log = []
    @attempts = 0
  end

  def make_guess(guess)
    @attempts += 1
    @guesses_log.push(guess)
    p @guesses_log
    check_guess(guess)
    print_guess(guess)
	print_result(@result_str)
	@result_str = ''
  end

  def check_guess(guess)
    red_count = 0
    white_count = 0
	c_count = 0
    for i in 0..3 do
      if guess[i] == @secret_code[i]
        red_count += 1
      end
    end
    unique_guess = guess.chars.uniq.join
    p unique_guess
    unique_guess.each_char do |c|
      c_count += @secret_code.count(c)
      puts "There are #{c_count} instances of #{c} in #{@secret_code}"
    end
    white_count = c_count - red_count
    @result_log.push([red_count, white_count])
    for i in 1..red_count
      @result_str += 'R'
	end
	for i in 1..white_count
      @result_str += 'W'
    end	
  end
      

  def print_guess(guess)
    print "Guess #{@attempts}: "
    guess.each_char { |char| print @guess_hash[char.to_sym], ' ' }
  end

  def print_result(result)
    print "Result #{@attempts}: "
    result.each_char { |char| print @result_hash[char.to_sym], ' ' }
    print "\n"
  end
end
