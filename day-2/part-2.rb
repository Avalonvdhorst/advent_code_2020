INPUT = []
File.readlines('input.txt').each do |line|
  INPUT << line.gsub(/[\r\n]/, '')
end

MATCH = /(?<pos_one>\d+)-(?<pos_two>\d+)\s(?<letter>\w):\s(?<text>.+)/

def convert_to_hash(array)
  array.map do |pass|
    pass.match(MATCH).named_captures
  end
end

passwords = convert_to_hash(INPUT)

def count_valid_passwords(passwords)
  passwords.select do |pass|
    (pass['text'][pass['pos_one'].to_i - 1] == pass['letter']) ^ (pass['text'][pass['pos_two'].to_i - 1] == pass['letter'])
  end
end

p count_valid_passwords(passwords).count

