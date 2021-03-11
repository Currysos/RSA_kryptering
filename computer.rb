# frozen_string_literal: true

require_relative 'bank'

def encrypt(message, public_key)
  encrypted_message = ''
  message.split('').each { |current_char|
    current_char_ascii = current_char.ord
    encrypted_message += ":#{((current_char_ascii**public_key[:e]) % public_key[:n])}"
  }
  encrypted_message
end

current_user = User.new(239, 313)

loop do
  puts 'Please enter your message (enter print to print messages): '
  answer = gets.chomp
  break if ['print', 'p', '', 'quit'].include?(answer)

  encrypted_message = encrypt(answer, current_user.public_key)
  puts "Your encrypted message: #{encrypted_message}"
  current_user.store_message(encrypted_message)
end
current_user.print_received_messages
