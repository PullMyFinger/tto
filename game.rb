require_relative "player.rb"

class Game
  def initialze
    self.decide_players
  end

  def decide_players
    puts "Player1 is Human?"
    input = gets.chomp
    if input == "yes"
      @p1 = HumanPlayer.new(:x)
    else
      AIPlayer.new
    end
    puts "Player2 is Human?"
    input = gets.chomp
    if input == "yes"
      @p2 = HumanPlayer.new(:o)
    else
      AIPlayer.new
    end
  end

  def game_over?
    
  end
end
