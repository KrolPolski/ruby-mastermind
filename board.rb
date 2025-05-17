class Board
  RED = "\x1b[2;37;41m  \033[0m"
  GREEN = "\x1b[2;37;42m  \033[0m"
  BLUE = "\x1b[2;37;44m  \033[0m"
  YELLOW = "\x1b[2;37;43m  \033[0m"
  MAGENTA = "\x1b[2;37;45m  \033[0m"
  CYAN = "\x1b[2;37;46m  \033[0m"

  def initialize(secret_code)
    @secret_code = secret_code
  end
  def print_board
    puts "\033[H"
    puts "BOARD HERE"
  end
end