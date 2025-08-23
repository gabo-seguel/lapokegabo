require "test_helper"

class FavoritePokemonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Guarda un pokemon en favorito" do
    pokemon = FavoritePokemon.new(id_pokemon: 150, name: "mewtwo")
    #1) Pokemon guardado exitosamente
    assert pokemon.valid?
  end

  test "no permite favoritos duplicados" do
    FavoritePokemon.create(id_pokemon: 25, name: "pikachu")
    duplicate = FavoritePokemon.new(id_pokemon: 25, name: "pikachu")
    #1) que no sea valida porque se creara 2 veces.
    assert_not duplicate.valid? 
    #2) si incluye el error lo comparo con el mensaje de error al crear pokemon duplicado
    assert_includes duplicate.errors[:id_pokemon], ":: El Pokemon ya esta en tu lista de favoritos" 
  end
end
