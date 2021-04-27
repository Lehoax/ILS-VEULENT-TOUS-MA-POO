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
game = Game.new(name_user)
nb = 0

while game.is_still_ongoing?
    game.menu
    game.menu_choice
    game.enemies_attack
    game.show_players
    game.is_still_ongoing?

end

game.end_game()