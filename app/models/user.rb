class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :beers
  # attr_accessible :title, :body

  def get_username
    at_sign_location = self.email.index("@")
    self.email[0..at_sign_location-1]
  end

  has_many :trieds
  has_many :beers, :through => :trieds
end
