# frozen_string_literal: true

# The Welcome class is responsible for greeting the user.
class Welcome
  def welcome_message
    p 'Welcome to Tic Tac Toe!'
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
  end

  def game_over
    p 'Game is over. Winner is ____'
  end
end

game_one = Welcome.new

game_one.welcome_message
game_one.print_board

puts 'Enter a position for X'
position = gets.chomp.to_i

game_one.mark_x(position)
game_one.print_board

puts 'Enter a position for O'
position = gets.chomp.to_i

game_one.mark_o(position)
game_one.print_board

game_one.game_over

## continue looping through get options until there is a winning combination

## eventually split this stuff into multiple smaller classes
