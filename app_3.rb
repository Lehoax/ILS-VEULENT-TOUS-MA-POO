require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


game = Game.new("Wolverine")

game.menu()