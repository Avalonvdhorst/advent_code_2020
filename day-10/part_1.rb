adapters = File.readlines("adapters.txt", chomp: true).map(&:to_i)

diff_1 = 1
diff_2 = 0
diff_3 = 1
p adapters.sort!

adapters.sort!.each_cons(2) do |a, b|
  diff = b - a
  eval("diff_#{diff} += 1")
end

p diff_1 * diff_3
p diff_1
p diff_3
