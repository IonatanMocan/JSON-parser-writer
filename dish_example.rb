require 'json'
file = File.read('names.json')
names_hash=JSON.parse(file)

first_names = names_hash.keys
last_names = names_hash.values
randomized_last_names = last_names.shuffle
randomized_hash = names_hash

i = 0
randomized_hash.each do |k, v|
  randomized_hash[k] = randomized_last_names[i]
  i += 1
end

puts randomized_hash


File.open("output.json","w") do |f|
  f.write(JSON.pretty_generate(randomized_hash))
end
