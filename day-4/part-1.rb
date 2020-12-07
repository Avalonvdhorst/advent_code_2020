class Passport
  VALID_KEYS = [:ecl, :pid, :byr, :iyr, :eyr, :hgt, :hcl]
  attr_reader :parsed

  def initialize(raw)
    @parsed = {}
    @raw = raw.gsub(/[\r\n]/, " ")
    parse
  end

  def parse
    @raw.split(" ").each do |fields|
      pair = fields.split(":")
      parsed[pair[0].to_sym] = pair[1]
    end
  end

  def valid?
    min_cid = parsed.dup
    min_cid.delete(:cid)
    min_cid.count == 7 && VALID_KEYS.sort == min_cid.keys.sort && valid_values?
  end

  def valid_values?
    parsed.all? do |k, _v|
      send("#{k}?")
    end
  end

  def cid?
    true
  end

  def ecl?
    ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"].include?(parsed[:ecl])
  end

  def pid?
    parsed[:pid].length == 9
  end

  def byr?
    year = parsed[:byr].to_i
    year >= 1920 && year <= 2020
  end

  def iyr?
    year = parsed[:iyr].to_i
    year >= 2010 && year <= 2020
  end

  def eyr?
    year = parsed[:eyr].to_i
    year >= 2020 && year <= 2030
  end

  def hgt?
    height = parsed[:hgt][0...-2].to_i
    unit = parsed[:hgt][-2..-1]
    if unit == "cm"
      height >= 150 && height <= 193
    elsif unit == "in"
      height >= 59 && height <= 76
    end
  end

  def hcl?
    parsed[:hcl].match(/#(\w{6}|\d{6})/)
  end
end

passports = File.open('passports.txt').read.split("\n\n").map do |input|
  Passport.new(input)
end

p passports.count { |passport| passport.valid? }

p passports.count

# passport1 = Passport.new("hcl:#cfa07d eyr:2025 pid:166559648
# iyr:2011 ecl:brn hgt:59in")

# p passport1.valid?
# .each do |line|
#   PASSPORTS << line.gsub(/[\r\n]/, '').split("")
# end

# PASSPORTS.each do |line|
#   line.join(" ")
# end
