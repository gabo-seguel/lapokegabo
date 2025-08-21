class CreateFavoritePokemons < ActiveRecord::Migration[8.0]
  def change
    create_table :favorite_pokemons do |t|
      t.integer :id_pokemon
      t.string :name
      t.string :elemental_type
      t.string :main_skills
      t.integer :total_skills
      t.integer :height
      t.integer :weight

      t.timestamps
    end
  end
end
