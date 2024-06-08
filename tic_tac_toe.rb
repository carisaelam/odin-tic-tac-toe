require_relative 'game_logic'
require 'pry-byebug'
require 'colorize'
require 'colorized_string'

class TicTacToe
  include GameLogic

  @game_over = false

  def p1_turn
    puts 'Player 1: Enter a position for X'.colorize(color: :blue, mode: :bold)
    position = gets.chomp.to_i
    puts ' '
    mark_x(position)
    result = check_for_winner
    @game_over = true unless result.nil?
    print_board
    puts ' '
  end

  def p2_turn
    puts 'Player 2: Enter a position for O'.colorize(color: :red, mode: :bold)
    position = gets.chomp.to_i
    puts ' '
    mark_o(position)
    result = check_for_winner
    @game_over = true unless result.nil?
    print_board
    puts ' '
  end

  def restart_game_prompt
    loop do
      puts 'Do you want to restart the game? (Y/N)'
      choice = gets.chomp.upcase
      if choice == 'Y'
        puts 'Restarting the game...'
        @p1_positions = []
        @p2_positions = []
        @row1 = %w[1 2 3]
        @row2 = %w[4 5 6]
        @row3 = %w[7 8 9]
        @game_over = false
        @winner = nil
        start
        break
      elsif choice == 'N'
        puts 'Exiting the game. Thank you for playing!'
        exit
      else
        puts 'Invalid choice. Please enter Y or N.'
      end
    end
  end

  def start
    puts ' '
    puts '~~Welcome to Tic Tac Toe~~'.colorize(color: :black, background: :cyan, mode: :bold)
    puts ' '

    print_board
    puts ' '

    until @game_over
      p1_turn
      break if @game_over

      p2_turn
      break if @game_over

    end

    restart_game_prompt
    binding.pry
  end
end

my_game = TicTacToe.new
my_game.start
