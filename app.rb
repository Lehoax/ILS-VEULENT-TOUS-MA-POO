require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

def state_break(player1, player2)
    puts "Voici l'état de nos joueurs :"
    player1.show_state
    player2.show_state
end


while (player1.life_points > 0) && (player2.life_points > 0) do
    state_break(player1, player2)
    puts
    puts"------------------------------------"
    puts
    puts "Passons à la phase d'attaque :"
    
    player1.attacks(player2)
    puts
    puts"------------------------------------"
    puts
    if player2.life_points <= 0
        break
      else
        player2.attacks(player1)
    end
end
#binding.pry
