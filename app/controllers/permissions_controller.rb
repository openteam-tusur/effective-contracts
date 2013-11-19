class PermissionsController < ApplicationController
  inherit_resources
  load_and_authorize_resource
  has_scope :by_user, :default => 1
  actions :all, :except => [:update]

  def show
    @factors = Factor.all
  end

  def edit
    user = User.find(params[:id])
    user.factors.each do |f|
      Factor.update(f.id, user_id: 0)
    end

    unless params[:factor].nil?
      params[:factor][:ids].each do |p|
        Factor.update(p, user_id: params[:id])
      end
    end
    redirect_to action: :index
  end
end
