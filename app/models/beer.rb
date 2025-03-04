class Beer < ApplicationRecord
  belongs_to :users_id

  validates :name, :degree, :centiliter, :unit_price, :conditionnement, :beer_type, presence: true
end
