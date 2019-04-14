class Pokemon
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :type, type: Array
  field :sprite, type: String
  field :evolution_chain, type: Array
end
