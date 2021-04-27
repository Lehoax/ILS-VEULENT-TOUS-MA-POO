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

enemies = [player1,player2]


def choice_for_humain(playerH, player1, player2)
    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner "

    puts "attaquer un joueur en vue :"
    puts "0 - #{player1.show_state}"
    puts "1 - #{player2.show_state}"

    choice_in_round = gets.chomp 

    if choice_in_round != 'a' && choice_in_round != 's' && choice_in_round != '0' && choice_in_round != '1'
        puts "Ton choix n'est pas valide tu passe ton tour"
    else
        if choice_in_round == 'a'
            playerH.search_weapon
        end
        if choice_in_round == 's'
            playerH.search_health_pack
        end
        if choice_in_round == '0'
            playerH.attacks(player1)
        end
        if choice_in_round == '1'
            playerH.attacks(player2)
        end
    end
    
end

while playerH.life_points > 0 && (player1.life_points > 0 && player2.life_points > 0)


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

    choice_for_humain(playerH, player1, player2)
    if player1.life_points <= 0  ||  player2 .life_points <= 0
        break
    end
    puts "Les autres joueurs t'attaquent !"
    enemies.each  do |player|
        player.attacks(playerH)
    end
end