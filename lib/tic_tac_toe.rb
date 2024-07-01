require_relative 'game_logic'
require 'colorize'
require 'colorized_string'

class TicTacToe
  include GameLogic

  def start
    puts ' '
    puts '~~Welcome to Tic Tac Toe~~'.colorize(color: :black, background: :cyan, mode: :bold)
    puts ' '

    collect_player_names

    print_board
    puts ' '

    until @game_over
      p1_turn
      break if @game_over
      break if @positions_taken.length == 9

      p2_turn
      break if @game_over
      break if @positions_taken.length == 9

    end

    restart_game_prompt
  end
end

my_game = TicTacToe.new
my_game.start
