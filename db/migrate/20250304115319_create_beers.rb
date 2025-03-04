class CreateBeers < ActiveRecord::Migration[7.1]
  def change
    create_table :beers do |t|
      t.string :name
      t.integer :degree
      t.integer :centiliter
      t.integer :unit_price
      t.string :conditionnement
      t.string :beer_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
