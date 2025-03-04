class AddDescriptionToBeers < ActiveRecord::Migration[7.1]
  def change
    add_column :beers, :description, :text
  end
end
