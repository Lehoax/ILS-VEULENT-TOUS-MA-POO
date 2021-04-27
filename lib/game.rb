
class Game
    attr_accessor :human_player, :enemies 
    def initialize(name)
        @enemies = [Player.new('jacque'), Player.new('pierre'), Player.new('paul'), Player.new('booba')]
        @Wolverine = HumanPlayer.new(name)
        
    end

    def kill_player(player_index)
        enemies.delete(player_index)
    end

    def is_still_ongoing?
        if @Wolverine.life_points <= 0 || @enemies.empty?
            return false
        else
            return true
        end
    end
    def show_players
        puts "Humain player : "     
        puts @Wolverine.show_state
        puts "il reste #{@enemies.length} bots"
    end
    def menu
        puts "Quelle action veux-tu effectuer ?"
        puts "a - chercher une meilleure arme"
        puts "s - chercher à se soigner "
    
        puts "attaquer un joueur en vue :"
    
            nb = 0
            @enemies.each do |e|
                puts "bot numero #{nb} - #{e.name}"
                nb += 1
            end
        puts "Ton choix : "
    end

    def menu_choice
        print ">"
        choice_in_round = gets.chomp 

        if choice_in_round  == 'a'
            @Wolverine.search_weapon()
        elsif choice_in_round  == 's'
            @Wolverine.search_health_pack()
        else
            if @enemies.empty?
                is_still_ongoing?()
            else
                if @enemies[choice_in_round.to_i].life_points <=0
                    kill_player(@enemies[choice_in_round.to_i])
                end
            end
      
            @Wolverine.attacks(@enemies[choice_in_round.to_i])
        end
    end
    
    def enemies_attack
        puts "Les autres joueurs t'attaquent !"
        enemies.each  do |player|
            player.attacks(@Wolverine)
        end
    end

    def end_game
        if @Wolverine.life_points > 0
            puts "victoire"
        else
            puts "looser"
        end
    end

end
