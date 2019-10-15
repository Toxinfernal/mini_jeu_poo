require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "*****************************************"
puts "Bienvenue dans ils veulent tous TON CUL"
puts "le but c'est de gagner"

puts "HERE COME A NEW CHALLENGER !"
puts "enter your name"

name = gets.chomp
player1 = HumanPlayer.new(name)

player_bot_1 = Player.new("José")
player_bot_2 = Player.new("Marie")

  while player1.life_points >= 0 || player_bot_1.life_points >= 0 && player_bot_2.life_points >= 0
    if player_bot_1.life_points <=0  && player_bot_2.life_points <= 0
      puts "Bravo tu as gagné"
      break
    end
    if player1.life_points <= 0
      puts "haha grosse merde"
      break
    end
    puts ""
    puts "****************************"
    puts ""
    puts "What are you gonna do now ?"
    puts "a - Chercher une meilleure arme"
    puts "b - Chercher à se soigner"
    puts ""
    puts "Ou alors tu peux défoncer la gueule de ces bots de merde"
    if player_bot_1.life_points >= 0 && player_bot_2.life_points >= 0
      puts "1 - Tu casses la gueule de José qui a #{player_bot_1.life_points} points de vie"
      puts "2 - Tu casses la gueule de marie qui a #{player_bot_2.life_points} points de vie"
      puts "3 - Tu es con et tu te tapes tout seul sachant que tu as #{player1.life_points} points de vie "
    elsif player_bot_1.life_points <= 0
      puts "1 - Tu t'acharnes sur un mort et ca ne va rien changer"
      puts "2 - Tu casses la gueule de marie qui a #{player_bot_2.life_points} points de vie"
      puts "3 - Tu es con et tu te tapes tout seul sachant que tu as #{player1.life_points} points de vie "
    elsif player_bot_2.life_points <= 0
      puts "1 - Tu casses la gueule de José qui a #{player_bot_1.life_points} points de vie"
      puts "2 - Tu t'acharnes sur un mort et ca ne va rien changer"
      puts "3 - Tu es con et tu te tapes tout seul sachant que tu as #{player1.life_points} points de vie "
    end

    puts ""

    action = gets.chomp

    if action == "a"
      player1.search_weapon
    elsif action == "b"
      player1.search_health_pack
    elsif action == "1"
      player1.attacks(player_bot_1)
    elsif action == "2"
      player1.attacks(player_bot_2)
    elsif action == "3"
      puts "Il se tape vraiment se con"
      player1.attacks(player1)
    elsif action != "a" || "b" || "1" || "2" || "3"
      puts "nan mais c'est soit l'action a , ou la b ou la 1 ou la 2 ou la 3 CT INTUITIF PUTAIN"
    end

    if player_bot_1.life_points > 0 || player_bot_2.life_points > 0
      puts ""
      puts "**************************"
      puts ""
      puts "C'est maintenant aux bots de te casser la gueule"
    Player.enemies.each do |en|
      if en.life_points > 0 && player1.life_points > 0 
        en.attacks(player1)
      end
    end
end
end



binding.pry
