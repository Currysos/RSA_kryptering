puts "Enter n:"
n = gets.chomp.to_i

puts "Enter e:"
e = gets.chomp.to_i

n_number = Math.sqrt(n).floor

n_number -= 2 while n % n_number != 0

puts "First prime = #{p = n_number}" 
puts "Second prime = #{q = n / p}"

phi_n = (q - 1) * (p - 1)

puts puts "Phi N = #{phi_n}"


d = 1
d += 1 while (d * e) % phi_n != 1

puts ("d = #{d}")

puts "Enter the encrypted message: "
encrypted_message = gets.chomp

decrypted_message = ''
encrypted_message.split(':').drop(1).each do |current_encrypted_char_ascii|
  decrypted_message += (current_encrypted_char_ascii.to_i.pow(d, n)).chr
end

puts "The original message: " + decrypted_message