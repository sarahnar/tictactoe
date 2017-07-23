class Game
  @@player_count = 0
  
  def initialize()
    @round = 0
    @finished = false
  
    @players = [Player.new('X'), Player.new('O')]
  end
  
  def check_winner
    (0..2).each do |y|
      if @board.cells[y][0].state == @board.cells[y][1].state && @board.cells[y][1].state == @board.cells[y][2].state && @board.cells[y][0].state != ' '
        return @board.cells[y][0].state
      elsif @board.cells[0][y].state == @board.cells[1][y].state && @board.cells[1][y].state == @board.cells[2][y].state && @board.cells[0][y].state != ' '
        return @board.cells[0][y].state
      end
    end
    if @board.cells[0][0].state == @board.cells[1][1].state && @board.cells[1][1].state == @board.cells[2][2].state && @board.cells[0][0].state != ' '
      return @board.cells[0][0]
    elsif @board.cells[0][2].state == @board.cells[1][1].state && @board.cells[1][1].state == @board.cells[2][0].state && @board.cells[0][2].state != ' '
      return @board.cells[0][2].state
    end
    
    egality = true
    (0..2).each do |y|
      (0..2).each do |x|
        egality = false if @board.cells[y][x].to_s == ' '
      end
    end
    
    return 'P' if egality
    return false
  end
  
  def start()
    restart = false
    loop do restart
      @board = Board.new

      puts @board.display_initial
      winner = false
      loop do
        @players[@round].play(@board)

        @round = 1 - @round

        winner = check_winner
        break if winner != false
      end
      if winner == 'X'
        puts "Congratulation #{@players[0].name} ! You won !"
      elsif winner == 'O'
        puts "Congratulation #{@players[1].name} ! You won !"
      elsif winner == 'P'
        puts "No winner ! Egality !"
      end
      puts "Do you want to play another game ? [Y/n]"
      t = gets.chomp
      restart = true if t == 'Y' or t == 'y'
    end
  end
end

g = Game.new
g.start()