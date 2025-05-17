require_relative "board"

class Mastermind
  # def random_code
  #   return [RED, GRN, BLU, YEL]
  #end
  def initialize
    @board = Board.new(4321)
    @board.print_board  
  end

end

game = Mastermind.new

