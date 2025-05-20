class ComputerPlayer
  def initialize(board)
    puts "We made a computer player woo"
    @options = ['R', 'G', 'Y', 'B']
    @board = board
    @solution_options = []
    @game_over = false
    first_guess
    next_guess unless @game_over == true
    until @game_over == true
      random_guess
    end
    puts "The computer guessed the code after #{@board.attempts} attempts."
    if @board.attempts > 12
      puts "You win!"
    else
      puts "You lose!"
    end
  end

  def random_guess
    # shuffle the solution options until we have a winner but we
    # need to avoid repeating guesses
    print "\n"
    random_guess = @solution_options.shuffle.join
    until @board.guesses_log.count(random_guess) == 0
      random_guess = @solution_options.shuffle.join
    end
    @game_over = @board.make_guess(random_guess)
  end
  def first_guess
    color1 = @options.sample
    @game_over = @board.make_guess("#{color1}#{color1}#{color1}#{color1}")
   # p @board.result_log[0][0]
    color1_count = @board.result_log[0][0]
    #p color1_count
    color1_count.times do 
      @solution_options.push(color1)
    end
    @options.delete(color1)
    #p @options
    #puts "Solution options so far are: #{@solution_options}"
  end
  def next_guess
    print "\n"
    curr_guess = @solution_options.dup.join
    next_color = @options.sample
    while curr_guess.length < 4
      curr_guess += next_color
    end
    @game_over = @board.make_guess(curr_guess)
    #p @board.result_log
    next_color_count = @board.result_log[-1][0] + @board.result_log[-1][1] - (@board.result_log[-2][0] + @board.result_log[-2][1])
    next_color_count.times do
      @solution_options.push(next_color)
    end
    @options.delete(next_color)
    if @solution_options.length != 4 && @game_over == false
      next_guess
    end
  end
end