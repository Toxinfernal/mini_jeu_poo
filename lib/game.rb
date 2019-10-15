class Game
  attr_accessor :human_player, :enemies
  @@enemies = []

  def initialize(name)

    @human_player = HumanPlayer.new(name)
  end

  def self.enemies
    @@enemies
  end

  def kill_player
    Player.each do |i|
      if i <= 0
        delete i
      end
    end
  end

  def is_still_ongoing?
    if @human_player.life_points > 0 && @@enemies.empty? == false
      puts "true"
    elsif  @human_player.life_points <= 0 && @@enemies.empty? == true
      puts "false"
    end
  end

  def show_players
    @human_player.show_state
    puts @@enemies
  end
end
