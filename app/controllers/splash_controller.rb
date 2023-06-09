class SplashController < ApplicationController
  def index
    return unless current_user

    redirect_to group_index_path
  end
end
