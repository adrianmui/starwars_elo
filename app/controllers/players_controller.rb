class PlayersController < ApplicationController
  include PlayersHelper

  def index
    @players = Player.all
    #save_player(get_person(1))
    flash.now[:notice] = "Welcome~"
  end

end
