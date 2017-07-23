=begin
class Cell
	attr_reader :index
	attr_accessor :boardcase

	def initialize(index)
    @entries = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]		
    @val = cell_index
	end

	def to_s
		return " #{val} "
	end	
end
=end

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