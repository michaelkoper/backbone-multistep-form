class Reward
  include Mongoid::Document
  include Mongoid::Timestamps

  field :amount,      type: Integer
  field :description, type: String

  embedded_in :product
end
