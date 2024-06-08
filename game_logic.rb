module GameLogic
  @winning_combinations = [
    'XXX******',
    'OOO******',
    '012XXX***',
    '***OOO***',
    '******XXX',
    '******OOO',
    'X**X**X**',
    'O**O**O**',
    '*X**X**X*',
    '*O**O**O*',
    '**X**X**X',
    '**O**O**O',
    'X***X***X',
    'O***O***O',
    '**X*X*X**',
    '**O*O*O**'
  ]

  def self.winning_combinations
    @winning_combinations
  end

  def initialize
    @row1 = %w[* * *]
    @row2 = %w[* * *]
    @row3 = %w[* * *]
    @board_snapshot = '*********'
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
    print_board
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
    if GameLogic.winning_combinations.include?(@board_snapshot)
      'Game Over'
    else
      'Play On'

    end
  end
end

class Game
  include GameLogic
end
