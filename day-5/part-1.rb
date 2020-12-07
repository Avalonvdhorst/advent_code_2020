class BoardingPass
  def initialize(bsp)
    @bsp = bsp
  end

  def row
    range = (0..127)
    @bsp.chars.first(8).each do |partition|
      range = range_partitioner(range, partition == 'F')
    end
    range.first
  end

  def column
    range = (0..7)
    @bsp.chars.last(3).each do |partition|
      range = range_partitioner(range, partition == 'L')
    end
    range.first
  end

  def seat_id
    (row * 8) + column
  end

  private

  def range_partitioner(range, lower_half)
    if lower_half
      (range.begin..((range.begin + range.end) / 2))
    else
      (((range.end + range.begin).to_f / 2).ceil..range.end)
    end
  end
end

boarding_passes = File.readlines("boarding_passes.txt", chomp: true).map do |pass|
  BoardingPass.new(pass)
end

highest = boarding_passes.max_by(&:seat_id)
p highest.seat_id

# p BoardingPass.new("RLR").column
# p BoardingPass.new("RRR").column
# p BoardingPass.new("RLL").column


