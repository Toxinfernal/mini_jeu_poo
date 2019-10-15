class Player
  attr_accessor :life_points, :name
  @@enemies = []

  def initialize(name)
    @life_points = 10
    @name = name
    @@enemies << self
  end

  def self.enemies
    @@enemies
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  def attacks(defender)
    puts "le joueur #{@name} attaque le joueur #{defender.name}"
    dmg = compute_damage
    puts "il lui inflige #{dmg} points de degats"
    defender.gets_damage(dmg)
  end

  def compute_damage
    return rand(1..6)
  end

  def gets_damage(dmg)
    @life_points -= dmg
    if @life_points <= 0
      puts" #{@name} est mort"
    else
      puts "il reste a #{@name} #{@life_points} points de vie"
    end
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    @life_points = 100
    @name = name
    @weapon_level = 1
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et son arme est de niveau #{@weapon_level}"
  end

  def compute_damage
    return rand(1..6) * @weapon_level
  end

  def search_weapon
    lvl = rand(1..6)
    puts "Bravo tu as trouvé une arme de niveau #{lvl}"
    if lvl > @weapon_level
      @weapon_level = @weapon_level + lvl - @weapon_level
      puts "Tu trouves une meilleure armes, tu la prends"
    else
      puts "C DLA MERDE CT SUR EN FAIT"
    end
  end

  def search_health_pack
    health = rand(1..6)
    if health == 1
      puts "tu n'as rien trouvé"
    elsif health >= 2 && health <= 5
      puts "Bravo tu as trouvé un pack de 50 points de vie"
      if @life_points < 50
        @life_points +=  50
      else
        @life_points = 100
      end
    elsif health == 6
      puts "wow la chance un pack de 80 points de vie"
      if @life_points < 20
        @life_points +=  80
      else
        @life_points = 100
      end
    end
  end
end
