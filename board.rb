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
    grid.each do |row|
      row.each do |spot|
        if spot == nil
          print "| |"
        end
      end
      print "\n"
    end
  end
end


a = Board.new
p a.grid
a.render
