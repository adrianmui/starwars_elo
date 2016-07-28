class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :height
      t.integer :mass
      t.integer :elo_rating, :default => 1200
      t.string :birth_year
      t.string :gender
      t.string :homeworld
      t.text :movie_appear, default: [].to_yaml

      t.timestamps
    end
  end
end
