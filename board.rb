require 'colorize'

class Board
#   RED = "\x1b[2;37;41m  \033[0m"
#   GREEN = "\x1b[2;37;42m  \033[0m"
#   BLUE = "\x1b[2;37;44m  \033[0m"
#   YELLOW = "\x1b[2;37;43m  \033[0m"
#   MAGENTA = "\x1b[2;37;45m  \033[0m"
#   CYAN = "\x1b[2;37;46m  \033[0m"
  
  def initialize(secret_code)
    @secret_code = secret_code
	@attempts = 0
	@box = "  "
	@guess_hash = {'R': @box.on_red, 'B': @box.on_blue, 'G': @box.on_green, 'Y': @box.on_light_yellow}
	@result_hash = {'R': @box.on_red, 'W': @box.on_white}
  end
  def print_guess(guess)
	#p guess
	#p @guess_hash
	#puts @guess_hash[:'R']
	@attempts += 1
	print "Guess #{@attempts}: "
	guess.each_char {|char| print @guess_hash[char.to_sym], ' '}
	#print "Guess #{@attempts}: #{@guess_hash[guess[0].to_sym]} #{@guess_hash[guess[1].to_sym]} #{@guess_hash[guess[2].to_sym]} #{@guess_hash[guess[3].to_sym]} "
  end
  def print_result(result)
    print "Result #{@attempts}: "
	result.each_char {|char| print @result_hash[char.to_sym], ' '}
	print "\n"
  end
end