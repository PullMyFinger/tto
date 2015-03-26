require_relative "player.rb"

class Game
  def initialze
    self.decide_players
    @board = Board.new
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

  def three_in_a_row
    0.upto(2) do |row|
      first = row.first
      second = first.next
      third = row.last
      return true if (first == second) && (second == third)
    end
    false
  end

  def three_in_a_col
    0.upto(2) do |row_index|
      first = @board[row_index, 0]
      second = @board[row_index, 1]
      third = @board[row_index, 2]
      return true if (first == second ) && (second == third)
    end
    false
  end

  def three_in_a_diag
    left_to_right_diag = [@board[0, 0], @board[1, 1], @board[2, 2]]
    right_to_left_diag = [@board[0, 2], @board[1, 1], @board[2, 0]]

    return true if left_to_right_diag[0] == left_to_right_diag[1] &&
                   left_to_right_diag[1] == left_to_right_diag[2]

    return true if right_to_left_diag[0] == right_to_left_diag[1] &&
                   right_to_left_diag[1] == right_to_left_diag[2]
    false
  end

  def draw
    board_is_full = !@board.flatten.include?(nil)
    no_wins = !three_in_a_row && !three_in_a_col && !three_in_a_diag
    board_is_full && no_wins
  end

  def game_over?
    three_in_a_row || three_in_a_col || three_in_a_diag || draw
  end
end
