winning_combos = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def check_win(winning_combos)
  p1_positions = [1, 2, 4, 5, 6]

  winning_combos.each do |combo|
    p combo
    p p1_positions

    # **checks if all elements in any of the winning combinations are included in the p1_positions array
    p "p1 wins with the combo #{combo}" if combo.all? { |position| p1_positions.include?(position) }
    puts ' '
  end
end

check_win(winning_combos)

# **
# like saying what is below:
# p1_positions.include?(combo[0]) && p1_positions.include?(combo[1]) && p1_positions.include?(combo[2])
