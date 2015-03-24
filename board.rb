require 'colorize'
require_relative "game.rb"
require_relative "player.rb"

class Board
  attr_accessor :grid

  def initialize
    @grid = create_grid
  end

  def create_grid
    grid = Array.new(3){ Array.new(3) }
  end

  def render
    row_num = 0
    print "   0  1  2 \n"
    grid.each do |row|
      print "#{row_num} "
      row_num += 1
      row.each do |spot|
        if spot == nil
          print "| |"
        else
          print spot
        end
      end
      print "\n"
    end
  end

  def [](row, col)
    @grid[row][col]
  end

  def []=(row, col, sym)
    @grid[row][col] = sym
  end

  def place_piece(row, col, sym)
    if self[row, col] == nil
      self[row, col]= sym
    else
      raise "Invalid move, try again."
    end
  end
end


a = Board.new
p a.grid
a.render
a[0, 1]= :red
p a[0, 1]
a.render
