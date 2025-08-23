require 'faraday'

class PokemonsController < ApplicationController
    #muestra el listado del pokemones de 20 en 20, paginados.
    def index
        # Llamada a la conexion de faraday
        all_data = PokeApiConnection.get_all_pokemons()
        
        # Paginación con Kaminari (20 por página)
        if !all_data.has_key?(:error)
            @paginated_pokemons = Kaminari.paginate_array(all_data["results"]).page(params[:page]).per(20)
        else
            @paginated_pokemons = {error: true}
        end      
    end

    # Muetra el pokemon seleccionado o buscado con su informacion.
    def showpokemon
        pokemon_name = ""
        pokemon_name = params[:pokemon_name]
        pokemon_name = params[:q]  if !params[:q].nil?
        if pokemon_name.to_s != "0"
            data_pokemon = PokeApiConnection.get_pokemon(pokemon_name)
            if !data_pokemon.has_key?(:error)
                @pokemon = {
                id: data_pokemon["id"],
                name: data_pokemon["name"],
                elemental_type: data_pokemon["types"][0]["type"]["name"],
                main_skill: data_pokemon["abilities"].map { |a| a["ability"]["name"] },
                total_skill: data_pokemon["moves"].count,
                weight: data_pokemon["weight"],
                height: data_pokemon["height"],
                image: data_pokemon["sprites"]["front_default"],
                error: false
                }
            else
                @pokemon = {error: true}
            end       
        else
            @pokemon = {error: true}
        end
    end

    # Agrega el pokemon a una lista de favoritos y los guarda en BD.
    # En modelo esta unicidad de pokemones favoritos.
    def addfavorites
        @pokemons_add = FavoritePokemon.new(sanitize_favorite_params)
        if @pokemons_add.save
            redirect_to showpokemon_path(params[:id_pokemon]), notice: "Pokemon agregado a favoritos"
        else
            redirect_to showpokemon_path(params[:id_pokemon]), notice: @pokemons_add.errors.full_messages.to_sentence
        end
    end

    def showfavorites
        @show_favorites_pokemons = FavoritePokemon.all
    end

    private
    def sanitize_favorite_params
        params.permit(
            :id_pokemon,
            :name,
            :elemental_type,
            :main_skills,
            :total_skills,
            :height,
            :weight
        )
    end
end