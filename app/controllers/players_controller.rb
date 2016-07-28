class PlayersController < ApplicationController
  include PlayersHelper

  def index
    @player_one = Player.all.sample
    @player_two = Player.all.sample

    if params[:id]
      id_arr = params[:id].split(",")
      a = Player.find(id_arr[0]).elo_rating
      b = Player.find(id_arr[1]).elo_rating
      win_elo = elo_calculate_win(a,b)
      lose_elo = elo_calculate_lose(b,a)
      # @player_one.update(:elo_rating => win_elo)
      Player.find(id_arr[0]).update(:elo_rating => win_elo)
      Player.find(id_arr[1]).update(:elo_rating => lose_elo)
      # @player_two.update(:elo_rating => lose_elo)
      flash.now[:notice] = "~elo updated"
    else


    flash[:notice] = "~"
    end
  end

  def show
    @player = Player.find(params[:id])
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
