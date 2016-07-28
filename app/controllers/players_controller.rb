class PlayersController < ApplicationController
  include PlayersHelper

  def index
    @players = Player.all
    
    flash[:notice] = "~"
  end

  def show
    @players = Player.all
  end

  def new 
    @players = Player.all
    
    
    if params[:movie]
      movie_num = params[:movie]
      id_arr = get_player_id_list_from_movie(movie_num)
      if save_all_players_from_movie(id_arr)
        flash[:notice] = "Loaded players from~ Movie: #{movie_num}"
      end
    end
  end


end
