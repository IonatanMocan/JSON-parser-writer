require 'json'
people = []

File.open("names.txt") do |file|
  people = file.readlines
end

people = people.join(" ")
final_array = people.split(" ")
first_names = []
last_names = []

i = 0
q = 0
final_array.each do |item|
  if final_array.index(item).even? || final_array.index(item) == 0
    first_names[i] = item
    i += 1
  else
    last_names[q] = item
    q += 1
  end
end

x, z, y = 0, 0, 0

(first_names.length).times do
  z=0
  (last_names.length).times do
    final_array[x] = [first_names[y], last_names[z]]
    x += 1
    z += 1
  end

  y += 1
end

print final_array.inspect

File.open("output.json","w") do |f|
  f.write(JSON.pretty_generate(final_array))
end
