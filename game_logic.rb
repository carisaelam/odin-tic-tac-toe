require 'colorize'
require 'colorized_string'
require 'pry-byebug'

module GameLogic
  def self.winning_combinations
    @winning_combinations
  end

  def initialize
    @row1 = %w[1 2 3]
    @row2 = %w[4 5 6]
    @row3 = %w[7 8 9]
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
      puts 'pick a valid position'
    end
    @p2_positions.push(position)
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
      puts 'pick a valid position'
    end
    @p1_positions.push(position)
  end

  def print_board
    p @row1
    puts ' '
    p @row2
    puts ' '
    p @row3
    puts ' '
  end

  def check_for_winner
    @winning_combos.each do |combo|
      if combo.all? { |position| @p1_positions.include?(position) }

        puts "Player One wins with the combo #{combo}".colorize(:green).bold
        puts ' '
        @winner = 'Player One'

      elsif combo.all? { |position| @p2_positions.include?(position) }
        puts "Player Two wins with the combo #{combo}".colorize(:green).bold
        puts ' '
        @winner = 'Player Two'
      end
    end
    @winner
  end
end

class Game
  include GameLogic
end
