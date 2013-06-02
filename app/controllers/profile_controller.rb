class ProfileController < ApplicationController

  before_filter :authenticate_user!

  def index
  end

  def add_tried_from_list
    @beers = Beer.all
  end

  def add_tried_by_new
    @beer = Beer.new
    @tried = Tried.new
  end

  def create_tried
    Tried.create_from_ids_and_rating current_user.id,
                                     params[:beer_id],
                                     params[:rating]

    redirect_to profile_index_path
  end

  def create_beer_and_tried
    @beer = Beer.new(params[:beer])

    if @beer.save
      tried = Tried.new
      tried.rating = params[:rating]
      tried.user_id = current_user.id
      tried.beer_id = @beer.id

      tried.save
    end

    redirect_to profile_index_path
  end

private

  def get_username_without_email user
    at_sign_location = user.email.index("@")
    user.email[0..at_sign_location-1]
  end
end
