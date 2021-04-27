class Game
    attr_accessor :human_player, :enemies 
    def initialize(name)
        @name = name
        @enemies = [Player.new('jacque'), Player.new('pierre'), Player.new('paul'), Player.new('booba')]
        @Wolverine = HumanPlayer.new('Wolverine')
        
    end

    def kill_player(player_index)
        enemies.delete_at(player_index)
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
        end


end