class ProfileController < ApplicationController

  before_filter :authenticate_user!

  def index
    @user = get_username_without_email current_user
  end

  def add_tried_from_list
    @selectable = true
  end

  def add_tried_by_new
  end

private

  def get_username_without_email user
    at_sign_location = user.email.index("@")
    user.email[0..at_sign_location-1]
  end
end
