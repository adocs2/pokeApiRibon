class Pokemon
  include Mongoid::Document
  include Mongoid::Timestamps
  field :pokemon_number, type: Integer
  field :name, type: String
  field :type, type: Array
  field :sprite, type: String
  field :evolution_chain, type: Array

  validates :pokemon_number, presence: true
  validates :name, presence: true
  validates :type, presence: true
  validates :evolution_chain, presence: true

end
