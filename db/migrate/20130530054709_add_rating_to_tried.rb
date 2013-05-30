class AddRatingToTried < ActiveRecord::Migration
  def change
    add_column :trieds, :rating, :integer
  end
end
