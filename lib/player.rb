class Player
    attr_accessor :name , :life_points
    def initialize(name)
        @name = name
        @life_points = 10
    end

    def show_state
        puts "#{@name} a #{@life_points} points de vie"
    end

    def gets_damage(nb)
        @life_points -= nb
        if @life_points <=0 ; puts "le joueur #{name} a été tué !"; @life_points = 0 end
    end
    def compute_damage
        return rand(1..6)
    end
    def attacks(player)
        damage = compute_damage()
        begin
            puts "#{@name} inflige #{damage} points de dommages a #{player.name}"
            player.gets_damage(damage)
        rescue
            puts ""
        end
            
    end
end

class HumanPlayer < Player
    attr_accessor :weapon_level, :life_points, :name
    def initialize(name)
        @name = name
        @life_points = 100
        @weapon_level = 1
    end
    def show_state
        puts "#{@name} a #{@life_points} points de vie et un arme de niveau #{@weapon_level}"
    end
    def compute_damage
        rand(1..6) * @weapon_level
    end
    def search_weapon
        rand_choice = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{ rand_choice }"
        if @weapon_level < rand_choice
            @weapon_level = rand_choice
            puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends"
        else
            puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
        end
    end
    def search_health_pack
        rand_choice = rand(1..6)
        if rand_choice == 1
            puts "Tu n'as rien trouvé... "
        elsif rand_choice <=2 && rand_choice >=5
            @life_points +=50
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
        else
            @life_points +=80
            puts "Waow, tu as trouvé un pack de +80 points de vie !"
        end
    end
    
end