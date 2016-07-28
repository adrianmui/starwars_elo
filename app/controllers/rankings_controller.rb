class RankingsController < ApplicationController

  def index

    @players = Player.all.sort_by { |char| char.elo_rating }.reverse
    
    flash[:notice] = "~#{@players[0].name} is the most popular Starwars character with the highest elo of #{@players[0].elo_rating}"
  end
end
