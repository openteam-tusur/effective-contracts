class MarksController < ApplicationController
  def index
    user = User.find(current_user.id)
    @factors = user.factors
    @users = User.all
  end
end
