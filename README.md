# LA POKE GABO

## Instrucciones de instalación
Se deben usar las siguientes versiones de ruby y rails.
Ruby: 3.4.5
Rails: 8.0.2.1
Base de datos usada: PostgreSQL
Gemas usadas para conexion API y paginación: faraday y kaminari
Api publica utilizada: https://pokeapi.co/

1) Clonar el proyecto
git clone [<URL_DEL_REPOSITORIO>](https://github.com/gabo-seguel/lapokegabo.git)

2) Abrir proyecto y agregar gemas en archivo "Gemfile"
-gem "kaminari"
-gem "faraday"
3) Ingresar al proyecto por consola y escribir bundle install para instalar gemas.

4) Configuración de la base de datos
En consola ejecutar los dos comandos para crear base de datos y ejecutar las migraciones.
-rails db:create
-rails db:migrate

5) Correr el servidor
-rails server
Luego abre tu navegador en http://localhost:3000

## Variables necesarias / configuración
Endpoints usado en api Externa: 
-  https://pokeapi.co/api/v2/pokemon

Configurar archivo config\database.yml con su usuario y pass si corresponde.

## Como correr Test
Tests del modelo
Para ejecutar los tests de FavoritePokemon (modelo):
-rails test test/models/favorite_pokemon_test.rb

Tests de controlador
Para ejecutar los tests de PokemonsController:
-rails test test/controllers/pokemons_controller_test.rb

Ejecutar todos los tests de la aplicación
-rails test

## Tests representativos

1. **Modelo: FavoritePokemon**
   - Valida que se guarde correctamente un pokemon en favoritos.
   - Valida que no se pueda agregar duplicados.

2. **Controlador: PokemonsController Metodo: addfavorites**
   - Solo agrega un pokemon si no está en favoritos.

## Decisiones de diseño
Arquitectura MVC + Service Objects:
La aplicación sigue la arquitectura clásica de Rails (MVC):
- Modelos: FavoritePokemon
- Controladores: PokemonsController
- Vistas: index.html, showpokemon.html, showfavorites.html

Tambien se utiliza Service Object para manejar la conexión con la API externa.
- Services: PokeApiConnection

Conexión con API externa
- Se usa la gema Faraday para realizar las peticiones a la api externa.

Paginación
- Se utiliza la gema Kaminari para mostrar pokemon en el índice de 20 en 20.

## Images de presentacion POKE GABO
- Pantalla inicial (index)
<img width="477" height="610" alt="image" src="https://github.com/user-attachments/assets/d836cbba-37d7-4c6f-ae77-42f35efca8e6" />

- Pantalla que muestra informacion de un pokemon
<img width="612" height="603" alt="image" src="https://github.com/user-attachments/assets/d153c5ca-0999-4845-9676-9d1e44397761" />




