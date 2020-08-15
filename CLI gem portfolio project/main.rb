

require_relative 'game_release_dates/lib/game_releases.rb'
require_relative 'game_release_dates/lib/game_release_dates/games.rb'
require 'bundler/inline'


# Bundler.require(:default)
# require_relative 'game_release_dates/lib/game_dates.rb'

GameReleases.new
puts "This is a successful test"