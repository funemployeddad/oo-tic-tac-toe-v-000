class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def input_to_index(user_input)
  user_input.to_i - 1
end


def move(position, token = "X")
  @board[position] = token
end


def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end


def valid_move?(index)
if index.between?(0, 8) && position_taken?(index) == false
true
end
end


def turn
 puts "Please enter 1-9:"
 input = gets.strip
 index = input_to_index(input)
 if valid_move?(index)
   move(index, current_player)
   display_board
 else
   turn
 end
end


def turn_count
@board.count do |cell|
  cell == "X" || cell == "O"
end
end

def current_player
  turn_count % 2 == 0 ? "X":"O"
end


def won?
WIN_COMBINATIONS.detect do |win_combination|

    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
      else
      false
    end
  end
end


def full?
 if @board.any? {|i| i == " "}
   false
 else
   true
 end
end


def draw?
 full? && !won?
end


def over?
  draw? || won?
end


def winner
if won?
  WIN_COMBINATIONS.each do |combo|
    if @board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]]
      return @board[combo[0]]
    end
  end
end
end


def play
  until over?
    turn
   end
   if draw?
    puts "Cat's Game!"
  elsif won?
    if winner == "X"
      puts "Congratulations X!"
    else
      puts "Congratulations O!"
    end
  end
end

end
