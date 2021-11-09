class Player
  attr_accessor :lives, :is_turn
  attr_reader :name

  def initialize(name, lives = 3, is_turn)
    @name = name
    @lives = lives
    @is_turn = is_turn
  end

  def update_turn
    self.is_turn = self.is_turn ? false : true
  end

  def decrement_lives
    self.lives -= 1
  end
end

# player_1 = Player.new("Player 1", 3, true)
# player_2 = Player.new("Player 2", 3, false)

# puts player_1.is_turn
# player_1.update_turn
# puts player_1.is_turn
# puts player_1.decrement_lives
# puts player_1.name

