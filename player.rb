=begin
class Player
    attr_accessor :name, :team
 
    @@player_count = 0

    def initialize(name)
        @name = gets.chomp   
        puts "Please enter the name for Player #{@@player_count + 1}." 
        if @@player_count < 1 
            @team = "X"
            @@player_count += 1 
        else
            @team = "O"
            @@player_count = 0     
    end
    puts "Welcome, #{@name}. you will be playing the team #{@team}'s.'"
    end
end
=end

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


