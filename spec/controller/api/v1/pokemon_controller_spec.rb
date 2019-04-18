require 'rails_helper'

RSpec.describe "PokemonController", type: :request do
  describe 'GET/pokemon' do
    it 'status 200' do
      get "/api/v1/pokemon"
      expect(response.status).to eql(200)
    end
  end
  describe "POST /api/v1/pokemon" do
    context "with valid parameters" do
      let(:valid_params) do
        {
            name: "chikorita",
            type: ["grass"],
            evolution_chain: ["chikorita", "bayleef", "meganium"]
        }
      end
      it "creates a new pokemon" do
        post "/api/v1/pokemon", params: valid_params
        expect(response).to have_http_status(:success)
      end

      it "creates a pokemon with the correct attributes" do
        expect {post "/api/v1/pokemon", params: valid_params}.to change(Pokemon, :count).by(1)
      end
    end
  end
  describe "DELETE /api/v1/pokemon" do
    context 'existing pokemon' do
      pokemon = FactoryGirl.create(:pokemon)
      it "delete pokemon" do
        expect {delete "/api/v1/pokemon/" + pokemon.id}.to change(Pokemon, :count).by(-1)
      end
    end
  end
end