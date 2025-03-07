class Beer < ApplicationRecord

  BEER_TYPES = %w[Ale IPA Amber Tripel].freeze
  CONDITIONNEMENTS = %w[Bouteille Canette Fût].freeze

  CENTILITER = [25, 33, 50, 75].freeze

  has_one_attached :photo

  belongs_to :user
  has_many :orders, dependent: :destroy

  validates :name, :degree, :centiliter, :unit_price, :conditionnement, :beer_type, presence: true
  validates :beer_type, inclusion: { in: BEER_TYPES }
  validates :conditionnement, inclusion: { in: CONDITIONNEMENTS }
  validates :centiliter, inclusion: { in: CENTILITER }

  include PgSearch::Model
  pg_search_scope :global_search,
                  against: %i[name beer_type conditionnement description],
                  associated_against: {
                    user: %i[first_name last_name]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
