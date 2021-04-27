require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


puts"------------------------------------------------"
puts"|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts"|Le but du jeu est d'être le dernier survivant !|"
puts"------------------------------------------------"

puts "Pour créer ton joueur entre ton nom"
print ">"
name_user = gets.chomp
playerH = HumanPlayer.new(name_user)


player1 = Player.new("Josiane")
player2 = Player.new("José")


def choice_for_humain(playerH, player1, player2)
    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner "

    puts "attaquer un joueur en vue :"
    puts "0 - #{player1.show_state}"
    puts "1 - #{player2.show_state}"
    
    
end

while playerH.life_points >0 && (player1.life_points > 0 || player2.life_points >0)


    puts
    puts"------------------------------------"
    puts "Voici l'état de nos joueurs :"
    puts"------------------------------------"
    puts
    player1.show_state
    player2.show_state
    playerH.show_state
    puts
    puts"------------------------------------"
    puts "Passons à la phase d'attaque :"
    puts"------------------------------------"
    puts

    player1.attacks(playerH)
    player2.attacks(playerH)
    playerH.attacks(player1)
    playerH.attacks(player2)

end