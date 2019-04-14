class Api::V1::PokemonController < ApiPokemonController
  before_action :get_pokemon, only:[:show]
  def index
    @pokemon = Pokemon.all
    render json:{
        data: @pokemon
    }
  end

  def show
  end

  def create
    @pokemon = Pokemon.new(pokemon_info)

    if @pokemon.save
      render json:{
          status: "success",
          message: "Pokemon was saved and sent to the PC Storage",
          data: @pokemon
      } else
        render json:{
        status: "error",
        message: "Error on save your pokemon...",
        data: @pokemon.errors
       }
    end
  end

  def destroy
    @pokemon = Pokemon.find(params[:id])
    @pokemon.destroy

    render json:{
        status: "success",
        message: "Pokemon was released",
        data: @pokemon
    }
  end

  private
  def get_pokemon
    @pokemon = Pokemon.find(params[:id])
    render json:{
        data: @pokemon
    }
  end

  def pokemon_info
    params.permit(:name, :type, :sprite, :evolution_chain)
  end

end