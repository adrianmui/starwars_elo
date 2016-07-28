class PlayersController < ApplicationController
  def index
    @players = Player.all
    flash.now[:notice] = "Welcome~"
  end

end
