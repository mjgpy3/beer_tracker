class Beer < ActiveRecord::Base
  @@generic_picture = 'generic_beer.png'

  attr_accessible :bottle, :brew, :brewery, :can, :picture, :users

  has_many :trieds
  has_many :users, :through => :trieds

  def get_picture_or_generic_if_none
    if self.picture == "" || self.picture == nil
      @@generic_picture
    else
      self.picture
    end
  end
end
