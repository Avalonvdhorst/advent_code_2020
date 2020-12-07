GRID = []
File.readlines('input.txt').each do |line|
  GRID << line.gsub(/[\r\n]/, '').split("")
end

GRID.each do |line|
  line.join(" ")
end

def trees_encounter(slopes)
  all_trees_encountered = []
  slopes.each do |slope|
    pos = [0, 0]
    number_of_trees = 0
    row_length = GRID[0].length
    until pos[1] >= GRID.length - 1
      pos[0] = (slope[0] + pos[0]) % row_length
      pos[1] += slope[1]
      number_of_trees += 1 if GRID[pos[1]][pos[0]] == "#"
    end
    all_trees_encountered << number_of_trees
  end
  all_trees_encountered
end

slopes = [[3, 1], [1, 1], [5, 1], [7, 1], [1, 2]]
p trees_encounter(slopes).reduce(&:*)
