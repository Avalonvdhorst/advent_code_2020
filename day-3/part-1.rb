GRID = []
File.readlines('input.txt').each do |line|
  GRID << line.gsub(/[\r\n]/, '').split("")
end

GRID.each do |line|
  puts line.join(" ")
end

POS = [0, 0]
number_of_trees = 0
row_length = GRID[0].length
slope = [3, 1]

until POS[1] >= GRID.length - 1
  POS[0] = (slope[0] + POS[0]) % row_length
  POS[1] += slope[1]
  p GRID[POS[1]][POS[0]]
  number_of_trees += 1 if GRID[POS[1]][POS[0]] == "#"
end
p number_of_trees

