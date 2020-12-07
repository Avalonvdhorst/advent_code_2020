INPUT = []
File.readlines('input.txt').each do |line|
  INPUT << line.gsub(/[\r\n]/, '')
end

MATCH = /(?<min>\d+)-(?<max>\d+)\s(?<letter>\w):\s(?<text>.+)/

def convert_to_hash(array)
  array.map do |pass|
    pass.match(MATCH).named_captures
  end
end

passwords = convert_to_hash(INPUT)

def count_correct_passwords(passwords)
  passwords.select do |password|
    letter_count = password["text"].count(password["letter"])
    password["min"].to_i <= letter_count && password["max"].to_i >= letter_count
  end
end

p count_correct_passwords(passwords).first(10)

