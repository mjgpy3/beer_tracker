class AddProperIdFieldsToTried < ActiveRecord::Migration
  def change
    add_column :trieds, :user_id, :integer
    add_column :trieds, :beer_id, :integer
  end
end
