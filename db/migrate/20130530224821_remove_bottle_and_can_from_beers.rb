class RemoveBottleAndCanFromBeers < ActiveRecord::Migration
  def up
    remove_column :beers, :bottle
    remove_column :beers, :can
  end

  def down
    add_column :beers, :can, :boolean
    add_column :beers, :bottle, :boolean
  end
end
