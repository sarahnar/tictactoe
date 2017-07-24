class BoardCase
    attr_accessor :state
    def initialize()
        @state = ' '
    end 
    def to_s 
        @state
    end 
end 

class Player
  attr_accessor :name

  def initialize(id)
    @id = id
    puts "Please enter the name for Player #{id}"
    @name = gets.chomp   #il veut que l'application demande nos  noms
    puts "Welcome, #{@name}. you will be playing #{@id}"
  end
  
  def play(board)
    moved = false
    puts "#{@name} it's your turn, where do you want to play? (between 1 & 9)"
    begin
      number = (gets.chomp).to_i
      line = (number - 1) / 3
      column = (number - 1) % 3

      if number > 0 and number < 10 and board.cells[line][column].state == ' ' then
        board.cells[line][column].state = @id
        moved = true
        puts board
      else
        puts "Impossible to play at this position, try again"
      end
    end while not moved
  end
end

class Board
  attr_accessor :cells

  def initialize
    #TO DO :
    #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
    #Ces instances sont rangées dans une array qui est l'attr_accessor de la classe
      
    @cells = Array.new(3)
    (0..2).each do |y|
      @cells[y] = Array.new(3)
      (0..2).each do |x|
        @cells[y][x] = BoardCase.new
      end
    end
  end
  
  def display_initial
    t = "-------------\n"
    (0..2).each do |x|
      t += "| #{x * 3 + 1} | #{x * 3 + 2} | #{x * 3 + 3} |\n"
      t += "-------------\n"
    end
    t
    end
  
  def to_s
    t = "-------------\n"
    (0..2).each do |y|
      (0..2).each do |x|
        t += "| #{@cells[y][x]} "
      end
      t += "|\n"
      t += "-------------\n"
    end
    t
    end
end 

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