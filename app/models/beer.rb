class Beer < ActiveRecord::Base
  @@generic_picture = 'generic_beer.png'

  attr_accessible :bottle, :brew, :brewery, :can, :picture, :users

  has_many :trieds, :dependent => :destroy
  has_many :users, :through => :trieds

  def get_picture_or_generic_if_none
    return @@generic_picture if self.picture == "" || self.picture == nil
    
    self.picture
  end
end
