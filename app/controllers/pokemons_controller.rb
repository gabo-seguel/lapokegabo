class PokemonsController < ApplicationController
    def index

        @pokemons = FavoritePokemon.all

    end

    def showpokemon
        @pokemon = FavoritePokemon.find_by(id_pokemon: params[:id_pokemon])
    end

    def addfavorite
        p "addfavorite"
    end

    def showfavorite
        p "showfavorite" 
    end    
end