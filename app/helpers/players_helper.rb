module PlayersHelper

  def get_all(type)
    JSON.parse(Swapi.get_all(type.to_s))
  end

  def get_person(id)
    JSON.parse(Swapi.get_person(id))
  end

  def save_player(hash)
    if Player.all.any? {|player| player[:name] == hash["name"] }
    else 
      @player = Player.new
      @player.name = hash["name"]
      @player.height =  hash["height"].to_i
      @player.mass = hash["mass"].to_i
      @player.birth_year = hash["birth_year"]
      @player.gender = hash["gender"]
      @player.homeworld  = hash["homeworld"]
      @player.save
    end
  end

  def get_player_id_list_from_movie(id)
    JSON.parse(Swapi.get_film(id))["characters"].map{ |x| x.scan(/\d{1,2}/)[0].to_i }
  end

  def save_all_players_from_movie(id_arr)
    id_arr.each do |id|
      save_player(get_person(id))
    end
  end


  #calculating elo
  def ex(a, b)
    1 / (1 + 10 ** ((b-a) / 400))
  end

  def elo_calculate_win(a,b)
    a + ( 35 * (2 - ex(a,b)) )
  end

  def elo_calculate_lose(a,b)
     a - ( 35 * (2 - ex(a,b)) )
   end
end
