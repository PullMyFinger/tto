require_relative "player.rb"

class Game
  def decide_players
    puts "Player1 is Human?"
    p1 = gets.chomp
    if p1 == "yes"
      HumanPlayer.new
    else
      AIPlayer.new
    end
    puts "Player2 is Human?"
    p2 = gets.chomp
    if p2 == "yes"
      HumanPlayer.new
    else
      AIPlayer.new
    end
  end
end
