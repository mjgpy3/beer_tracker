class Beer < ActiveRecord::Base
  attr_accessible :bottle, :brew, :brewery, :can, :picture
end
