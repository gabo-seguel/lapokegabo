require 'faraday'

class PokeApiConnection
  BASE_URL = "https://pokeapi.co/api/v2/pokemon"

  def self.get_all_pokemons()
    url = "#{BASE_URL}?limit=2000"
    connection = Faraday.new(url: url) do |f|
      f.response :json # convierte JSON → Hash automático
    end
    response = connection.get do |req|
      req.options.timeout = 5       # espera máxima de respuesta
      req.options.open_timeout = 2  # tiempo máximo para abrir la conexión
    end

    if response.success?
      response.body # Esto ya es un hash Ruby con los datos del Pokémon
    else
      { error: "Error HTTP: #{response.status}" }
    end

    rescue Faraday::TimeoutError
      { error: "Tiempo de espera agotado al conectar con la API" }
    rescue Faraday::ConnectionFailed
      { error: "No se pudo conectar a la API" }
    rescue JSON::ParserError
      { error: "La API devolvio un JSON invalido" }
    rescue StandardError => e
      { error: "Error inesperado: #{e.message}" }
  end

  def self.get_pokemon(params)
    url = "#{BASE_URL}/#{params}"
    connection = Faraday.new(url: url) do |f|
      f.response :json # convierte json a hash automatico
    end

    response = connection.get do |req|
      req.options.timeout = 5       
      req.options.open_timeout = 2
    end

    if response.success?
      response.body
    else
      { error: "Error HTTP: #{response.status}" }
    end

    rescue Faraday::TimeoutError
      { error: "Tiempo de espera agotado al conectar con la API" }
    rescue Faraday::ConnectionFailed
      { error: "No se pudo conectar a la API" }
    rescue JSON::ParserError
      { error: "La API devolvió un JSON inválido" }
    rescue StandardError => e
      { error: "Error inesperado: #{e.message}" }

  end
end