require 'colorize'
require 'colorized_string'

module GameLogic
  def self.winning_combinations
    @winning_combinations
  end

  def initialize
    @row1 = %w[1 2 3]
    @row2 = %w[4 5 6]
    @row3 = %w[7 8 9]
    @game_over = false
    @p1_name = 'Player One'
    @p2_name = 'Player Two'
    @p1_positions = []
    @p2_positions = []
    @winning_combos = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
      [1, 4, 7],
      [2, 5, 8],
      [3, 6, 9],
      [1, 5, 9],
      [3, 5, 7]
    ]
    @winner = nil
    @positions_taken = []
  end

  def mark_x(position)
    case position
    when 1 then @row1[0] = 'X'
    when 2 then @row1[1] = 'X'
    when 3 then @row1[2] = 'X'
    when 4 then @row2[0] = 'X'
    when 5 then @row2[1] = 'X'
    when 6 then @row2[2] = 'X'
    when 7 then @row3[0] = 'X'
    when 8 then @row3[1] = 'X'
    when 9 then @row3[2] = 'X'
    else
      puts 'select a valid position'
    end
    @p1_positions.push(position)
    @positions_taken.push(position)
  end

  def mark_o(position)
    case position
    when 1 then @row1[0] = 'O'
    when 2 then @row1[1] = 'O'
    when 3 then @row1[2] = 'O'
    when 4 then @row2[0] = 'O'
    when 5 then @row2[1] = 'O'
    when 6 then @row2[2] = 'O'
    when 7 then @row3[0] = 'O'
    when 8 then @row3[1] = 'O'
    when 9 then @row3[2] = 'O'
    else
      puts 'select a valid position'
    end
    @p2_positions.push(position)
    @positions_taken.push(position)
  end

  def print_board
    p @row1.join(' | ')
    puts '---+---+---'
    p @row2.join(' | ')
    puts '---+---+---'
    p @row3.join(' | ')
    puts ' '

    p @positions_taken
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

  def check_for_winner
    @winning_combos.each do |combo|
      if combo.all? { |position| @p1_positions.include?(position) }

        puts "#{@p1_name} wins with the combo #{combo}".colorize(:green).bold
        puts ' '
        @winner = "#{@p1_name}"

      elsif combo.all? { |position| @p2_positions.include?(position) }
        puts "#{@p2_name} wins with the combo #{combo}".colorize(:green).bold
        puts ' '
        @winner = "#{@p2_name}"
      end
    end
    @winner
  end
end

class Game
  include GameLogic
end
