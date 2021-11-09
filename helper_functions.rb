def get_username
  print "Please enter your player name: "
  player = gets.chomp

  player = "Russell" if player == ""

  return player
end

def get_random_turn
  rand_num = rand(2)

  rand_num == 0 ? false : true
end