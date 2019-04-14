namespace :gen1 do
  task addAllPokemons: :environment do
    (1..151).each {|id|
      pokemon_evolution_chain = []
      pokemon_types = []
      pokemon = HTTParty.get('https://pokeapi.co/api/v2/pokemon/' + id.to_s)
      pokemon_species = HTTParty.get('https://pokeapi.co/api/v2/pokemon-species/' + pokemon['name'])
      pokemon_evolution_chain_response = HTTParty.get(pokemon_species['evolution_chain']['url'])

      #puts pokemon['name']
      #puts pokemon['sprites']['front_default']
      for type in pokemon['types']
        pokemon_types.push(type['type']['name'])
      end

      pokemon_chain = pokemon_evolution_chain_response['chain']
      while !!pokemon_chain && pokemon_chain.has_key?('evolves_to') do
        pokemon_evolution_chain.push(pokemon_chain['species']['name'])
        pokemon_chain = pokemon_chain['evolves_to'][0]
      end
      #puts pokemon_types
      #puts pokemon_evolution_chain
      #puts '-----------'
      Pokemon.create(name: pokemon['name'], type: pokemon_types, sprite: pokemon['sprites']['front_default'], evolution_chain: pokemon_evolution_chain)
    }
  end
end
