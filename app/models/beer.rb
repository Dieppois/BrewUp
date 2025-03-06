class Beer < ApplicationRecord
  BEER_TYPES = %w[Lager Pale Ale IPA Stout Porter Pilsner Wheat Beer Saison Amber Ale Tripel].freeze
  CONDITIONNEMENTS = %w[Bouteille Canette Fût].freeze
  CENTILITER = [25, 33, 50, 75].freeze

  has_one_attached :photo

  belongs_to :user
  has_many :orders

  validates :name, :degree, :centiliter, :unit_price, :conditionnement, :beer_type, presence: true
  validates :beer_type, inclusion: { in: BEER_TYPES }
  validates :conditionnement, inclusion: { in: CONDITIONNEMENTS }
  validates :centiliter, inclusion: { in: CENTILITER }
end
