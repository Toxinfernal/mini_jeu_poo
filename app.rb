require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


player1 = Player.new("Marie")
player2 = Player.new("Joseph")


  while player1.life_points > 0 || player2.life_points > 0

    puts "Voici l'état de nos deux CHALLENGER !!!"
    player1.show_state
    player2.show_state

    puts "******************************************"

    puts "GET READY TO RUMBLE"

    player2.attacks(player1)
    if player1.life_points <= 0
      break
    end

    player1.attacks(player2)
    if player2.life_points <= 0
      break
    end
    puts "******************************************"
  end

  binding.pry
