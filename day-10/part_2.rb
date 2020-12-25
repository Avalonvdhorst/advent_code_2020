adapters = File.readlines("mini_test.txt", chomp: true).map(&:to_i)

adapters.push(0)
adapters.push(adapters.max + 3)
p adapters.sort!
diff_1 = 0
diff_2 = 0
diff_3 = 0

adapters.sort!.each_cons(2) do |a, b|
  diff = b - a
  eval("diff_#{diff} += 1")
end

p diff_1
# longest_seq = adapters.sort
# total = 0
# (1..diff_1).each do |n|
#   tmp = 1
#   n.times do
#     tmp += diff_1 - n
#   end
#   total += tmp
#   p total
# end
# p total

# adapters sorted
# [0, 1, 4, 5, 6, 7, 10, 11, 12, 15, 16, 19, 22]
# (0), 1, 4, 5, 6, 7, 10, 11, 12, 15, 16, 19, (22)
# (0), 1, 4, 5, 6, 7, 10, 12, 15, 16, 19, (22)
# (0), 1, 4, 5, 7, 10, 11, 12, 15, 16, 19, (22)
# (0), 1, 4, 5, 7, 10, 12, 15, 16, 19, (22)
# (0), 1, 4, 6, 7, 10, 11, 12, 15, 16, 19, (22)
# (0), 1, 4, 6, 7, 10, 12, 15, 16, 19, (22)
# (0), 1, 4, 7, 10, 11, 12, 15, 16, 19, (22)
# (0), 1, 4, 7, 10, 12, 15, 16, 19, (22)
