class RankingsController < ApplicationController

  def index

    @players = Player.all
    
    flash[:notice] = "~"
  end
end
