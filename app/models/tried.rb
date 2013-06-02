class Tried < ActiveRecord::Base
  belongs_to :user
  belongs_to :beer

  def get_beer
    Beer.find(self.beer_id)
  end

  def self.create_from_ids_and_rating user_id, beer_id, rating
    tried = Tried.new

    tried.user_id = user_id
    tried.beer_id = beer_id
    tried.rating = rating

    tried.save
  end
end
