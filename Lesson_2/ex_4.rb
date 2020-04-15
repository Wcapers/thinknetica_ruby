hash = Hash[('a'..'z').to_a.zip((1..26).to_a)]
arr =  %w(a e i o u y)
fin = Hash[arr.zip(1..6).to_a]
fin.each do |i, z|
   fin[i] = hash[i]
end
puts fin
