class ChangeRatingFromIntegerToFloatInTried < ActiveRecord::Migration
  def change
    change_column :trieds, :rating, :float
  end
end
