class CreateTrieds < ActiveRecord::Migration
  def change
    create_table :trieds do |t|

      t.timestamps
    end
  end
end
