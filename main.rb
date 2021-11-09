require "./Player"
require "./helper_functions"

NUMBER_OF_LIVES = 3

# Allow user to select their own usernames
player_1_name = get_username
player_2_name = get_username

puts "Hello #{player_1_name} and #{player_2_name}, welcome to the hardest challenge of your life.... ENJOY! (also, type quit if you want to leave at any point)"
puts

# Create new class objects for the players
turn = get_random_turn
player_1 = Player.new(player_1_name, NUMBER_OF_LIVES, turn)
player_2 = Player.new(player_2_name, NUMBER_OF_LIVES, !turn)

main_loop_flag = true

while main_loop_flag do
  number_1 = rand(1..20)
  number_2 = rand(1..20)
  answer = number_1 + number_2

  question_player = player_1.is_turn ? player_1 : player_2
  answer_player = player_2.is_turn ? player_1 : player_2

  puts "#{question_player.name}: What does #{number_1} plus #{number_2} equal?"
  
  # validate user input
  while true do
    print "#{answer_player.name}: "
    input = gets.chomp
    input_number = input.to_i

    # Allow user to manually quit
    if input == "quit"
      main_loop_flag = false
      break
    end
  
    if input_number == 0
      puts "Incorrect entry, please guess a valid integer"
    else
      break
    end
  end

  if input_number == answer
    puts "#{question_player.name}: YES! You are correct."
  else
    puts "#{question_player.name}: Seriously? No!"
    lives = answer_player.decrement_lives
  end

  if lives == 0
    puts "#{question_player.name} wins with a score of #{question_player.lives}/#{NUMBER_OF_LIVES}"
    puts "----- GAME OVER -----"
    puts "Good-bye!"
    break
  end

  player_1.update_turn
  player_2.update_turn

  puts "P1: #{player_1.lives}/#{NUMBER_OF_LIVES} vs P2: #{player_2.lives}/#{NUMBER_OF_LIVES}"
  puts "----- NEW TURN -----"

end