class Tried < ActiveRecord::Base
  belongs_to :user
  belongs_to :beer

  def get_beer
    Beer.find(self.beer_id)
  end
end
