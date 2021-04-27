class Game
    attr_accessor :human_player, :enemies 
    def initialize(name)
    @name = name
    @enemies = [Player.new('jacque'), Player.new('pierre'), Player.new('paul'), Player.new('booba')]

end