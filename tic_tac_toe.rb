require_relative 'game_logic'
require 'pry-byebug'
require 'colorize'
require 'colorized_string'

class TicTacToe
  include GameLogic

  @game_over = false
  @p1_name = 'Player One'
  @p2_name = 'Player Two'

  def retry_turn_p1
    puts 'retrying turn...'
    p1_turn
  end

  def retry_turn_p2
    puts 'retrying turn...'
    p2_turn
  end

  def p1_turn
    puts "#{@p1_name}: Enter a position for X".colorize(color: :blue, mode: :bold)
    position = gets.chomp.to_i
    puts ' '
    if @positions_taken.include?(position) || position > 9 || position < 1
      puts 'Not a valid position'
      @p1_positions.delete(position)
      retry_turn_p1
    else
      mark_x(position)
      result = check_for_winner
      @game_over = true unless result.nil?
      print_board
      puts ' '
    end
  end

  def p2_turn
    puts "#{@p2_name}: Enter a position for O".colorize(color: :red, mode: :bold)
    position = gets.chomp.to_i
    puts ' '
    if @positions_taken.include?(position) || position > 9 || position < 1
      puts 'Not a valid position'
      @p2_positions.delete(position)
      retry_turn_p2
    else
      mark_o(position)
      result = check_for_winner
      @game_over = true unless result.nil?
      print_board
      puts ' '
    end
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
        @positions_taken = []
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

  def collect_player_names
    puts 'Player 1: What is your name?'
    @p1_name = gets.strip
    puts "Thanks #{@p1_name}!"
    puts ' '

    puts 'Player 2: What is your name?'
    @p2_name = gets.strip
    puts "Thanks #{@p2_name}!"
    puts ' '
  end

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
