class ComputerPlayer
  def initialize(board)
    puts "We made a computer player woo"
    @options = ['R', 'G', 'Y', 'B']
    @board = board
    @solution_options = []
    first_guess
    next_guess
  end
  def first_guess
    color1 = @options.sample
    @board.make_guess("#{color1}#{color1}#{color1}#{color1}")
    p @board.result_log[0][0]
    color1_count = @board.result_log[0][0]
    p color1_count
    color1_count.times do 
      @solution_options.push(color1)
    @options.delete(color1)
    p @options
    end
    puts "Solution options so far are: #{@solution_options}"
  end
  def next_guess
    curr_guess = @solution_options.dup.join
    next_color = @options.sample
    while curr_guess.length < 4
      curr_guess += next_color
    end
    @board.make_guess(curr_guess)
    p @board.result_log
    next_color_count = @board.result_log[-1][0] + @board.result_log[-1][1] - (@board.result_log[-2][0] + @board.result_log[-2][1])
    next_color_count.times do
      @solution_options.push(next_color)
    end
    @options.delete(next_color)
    if @solution_options.length != 4
      next_guess
    end
  end
end