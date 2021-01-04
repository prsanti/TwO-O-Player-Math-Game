class Player
  attr_accessor :lives, :current_player

  def initialize
    @lives = 3
    @current_player = false
  end
end