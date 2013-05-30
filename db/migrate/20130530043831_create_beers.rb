class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :brewery
      t.string :brew
      t.boolean :bottle
      t.boolean :can
      t.string :picture

      t.timestamps
    end
  end
end
