class Beer < ActiveRecord::Base
  attr_accessible :bottle, :brew, :brewery, :can, :picture, :users

  has_many :trieds
  has_many :users, :through => :trieds
end
