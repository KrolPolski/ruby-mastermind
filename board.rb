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
    # p @guesses_log
    game_over = check_guess(guess)
    print_guess(guess)
    print_result(@result_str)
    @result_str = ''
    game_over
  end

  def check_guess(guess)
    game_over = false
    red_count = 0
    white_count = 0
    c_count = 0
    working_guess = guess.dup
    working_code = @secret_code.dup
    #puts "Before: working_guess: #{working_guess} secret_code:{#{@secret_code}}"
    for i in 0..3 do
      if working_guess[i] == working_code[i]
        red_count += 1
        working_guess[i] = '.'
        working_code[i] = ','
       # puts "working_guess: #{working_guess} secret_code:{#{@secret_code}}"
      end
    end
    for i in 0..3 do
      index = working_code.index(working_guess[i])
      if index != nil
        c_count += 1
        working_guess[i] = '.'
        working_code[index] = ','
      end
    end
    white_count = c_count
    @result_log.push([red_count, white_count])
    game_over = true if red_count == 4
    for i in 1..red_count
      @result_str += 'R'
    end
    for i in 1..white_count
      @result_str += 'W'
    end
    game_over
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
