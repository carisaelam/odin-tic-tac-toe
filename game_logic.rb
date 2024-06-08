module GameLogic
  def self.winning_combinations
    @winning_combinations
  end

  def initialize
    @row1 = %w[0 1 2]
    @row2 = %w[3 4 5]
    @row3 = %w[6 7 8]
    @board_snapshot = '*********'
    @p1_positions = []
    @p2_positions = []
    @winning_combos = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ]
    @winner = nil
  end

  def mark_o(position)
    case position
    when 0 then @row1[0] = 'O'
    when 1 then @row1[1] = 'O'
    when 2 then @row1[2] = 'O'
    when 3 then @row2[0] = 'O'
    when 4 then @row2[1] = 'O'
    when 5 then @row2[2] = 'O'
    when 6 then @row3[0] = 'O'
    when 7 then @row3[1] = 'O'
    when 8 then @row3[2] = 'O'
    else
      puts 'pick a valid position'
    end
    @p2_positions.push(position)
    print_board
    puts "p2 positions include #{@p2_positions}"
  end

  def mark_x(position)
    case position
    when 0 then @row1[0] = 'X'
    when 1 then @row1[1] = 'X'
    when 2 then @row1[2] = 'X'
    when 3 then @row2[0] = 'X'
    when 4 then @row2[1] = 'X'
    when 5 then @row2[2] = 'X'
    when 6 then @row3[0] = 'X'
    when 7 then @row3[1] = 'X'
    when 8 then @row3[2] = 'X'
    else
      puts 'pick a valid position'
    end
    @p1_positions.push(position)
    print_board
    puts "p1 positions include #{@p1_positions}"
    print_board
  end

  def print_board
    puts @row1.inspect
    puts @row2.inspect
    puts @row3.inspect
    @board_snapshot = [@row1, @row2, @row3].join
    p @board_snapshot
    @board_snapshot
  end

  def check_for_winner
    @winning_combos.each do |combo|
      p combo
      p "#{@p1_positions} #{@p2_positions}"

      if combo.all? { |position| @p1_positions.include?(position) }

        p "p1 wins with the combo #{combo}"
        @winner = 'Player One Wins'

      elsif combo.all? { |position| @p2_positions.include?(position) }
        p "p2 wins with the combo #{combo}"
        @winner = 'Player Two Wins'
      end
    end
    @winner
  end
end

class Game
  include GameLogic
end
