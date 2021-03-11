# frozen_string_literal: true

# A user class made to creat a new user and store encrypted messages
# It can also decrypt messages and show the original using RSA encryption
class User
  attr_reader :public_key



  def initialize(prime1, prime2)
    n = prime2 * prime1
    phi_n = (prime1 - 1) * (prime2 - 1)
    # e
    e = 2
    e += 1 while e.gcd(phi_n) != 1
    # d - variable
    d = 1
    d += 1 while (d * e) % phi_n != 1 % phi_n
    @public_key = { e: e, n: n }
    @private_key = { d: d, n: n }
    puts 'Welcome to our bank user!'
    puts "Your public key is (e: #{@public_key[:e]}, n: #{@public_key[:n]})"

    @received_messages = []
  end

  def decrypt(encrypted_message)
    decrypted_message = ''
    encrypted_message.split(':').drop(1).each do |current_encrypted_char_ascii|
      decrypted_message += ((current_encrypted_char_ascii.to_i**@private_key[:d]) % @private_key[:n]).chr
    end
    decrypted_message
  end

  def store_message(message)
    decrypted_message = decrypt(message)
    @received_messages << decrypted_message
  end

  def print_received_messages
    @received_messages.each do |current_message|
      puts current_message
    end
  end
end

# require 'openssl'
# puts("Enter message")
# message = gets.chomp
# key = OpenSSL::PKey::RSA.new(2048)
# p encrypted_string = key.public_encrypt(message, OpenSSL::PKey::RSA::PKCS1_OAEP_PADDING)
# p decrypted_string = key.private_decrypt(encrypted_string, OpenSSL::PKey::RSA::PKCS1_OAEP_PADDING)
