require_relative 'game_logic'
require 'pry-byebug'

class TicTacToe
  include GameLogic

  def start
    p 'Welcome to Tic Tac Toe'
    p 'Play against a friend!'

    loop do
      print_board
      p 'Enter a position for X'
      position = gets.chomp.to_i
      mark_x(position)
      binding.pry
      result = check_for_winner
      print_board
      p 'Enter a position for O'
      position = gets.chomp.to_i
      mark_o(position)
      break if result == 'Game Over'
    end
  end
end

my_game = TicTacToe.new

my_game.start
