class Beer < ApplicationRecord
  belongs_to :user

  validates :name, :degree, :centiliter, :unit_price, :conditionnement, :beer_type, presence: true
end
