class UsersController < ApplicationController
  def show
    @user = User.find_by(unique_id: params[:unique_id])
  end

end
