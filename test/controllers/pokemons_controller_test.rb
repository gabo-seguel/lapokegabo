require "test_helper"

class PokemonsControllerTest < ActionDispatch::IntegrationTest
    test "no agrega pokemones duplicados" do
        # Creamos un Pokémon favorito ya existente
        FavoritePokemon.create!(id_pokemon: 25, name: "pikachu")

        # Intentamos agregar el mismo
        assert_no_difference("FavoritePokemon.count") do
        post addfavorites_path, params: {
            id_pokemon: 25,
            name: "pikachu",
            elemental_type: "electric",
            main_skills: ["static"],
            total_skills: 1,
            weight: 60,
            height: 4
        }
        end

        follow_redirect!
        assert_match /:: El Pokemon ya esta en tu lista de favoritos/, @response.body
    end
end