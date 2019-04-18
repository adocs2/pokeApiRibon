require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  context "Validate Pokemon" do
    it "Pokemon is valid" do
      pokemon = Pokemon.new
      pokemon.name = "chikorita"
      pokemon.pokemon_number = 152
      pokemon.type = ["grass"]
      pokemon.evolution_chain = ["chikorita", "bayleef", "meganium"]

      expect(pokemon.valid?).to be_truthy
    end
    it "Pokemon is not valid" do
      pokemon = Pokemon.new
      pokemon.name = "chikorita"
      pokemon.pokemon_number = 152
      pokemon.evolution_chain = ["chikorita", "bayleef", "meganium"]

      expect(pokemon.valid?).to be_falsy
    end
  end
end