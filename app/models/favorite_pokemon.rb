class FavoritePokemon < ApplicationRecord
    # Validación de unicidad: no permite duplicados de id_pokemon
    validates :id_pokemon, uniqueness: { message: ":: El Pokemon ya esta en tu lista de favoritos" }
end
