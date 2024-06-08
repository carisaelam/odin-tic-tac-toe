require_relative 'game_logic'
require 'pry-byebug'

class TicTacToe
  include GameLogic

  @game_over = false

  def p1_turn
    print_board
    p 'Player 1: Enter a position for X'
    position = gets.chomp.to_i
    mark_x(position)
    result = check_for_winner
    @game_over = true unless result.nil?
  end

  def p2_turn
    print_board
    p 'Player 2: Enter a position for O'
    position = gets.chomp.to_i
    mark_o(position)
    result = check_for_winner
    @game_over = true unless result.nil?
  end

  def start
    p 'Welcome to Tic Tac Toe'
    p 'Play against a friend!'

    until @game_over
      p1_turn
      break if @game_over

      p2_turn
      break if @game_over
    end
  end
end

my_game = TicTacToe.new

my_game.start
