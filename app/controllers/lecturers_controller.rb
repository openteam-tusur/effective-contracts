class LecturersController < ApplicationController
  inherit_resources
  load_and_authorize_resource
  actions :index
  layout false
  respond_to :json

  def collection
    super.where("author LIKE ?", "%#{params[:term]}%" )
  end
end
