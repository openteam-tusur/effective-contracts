class PermissionsController < ApplicationController
  require 'yaml'
  inherit_resources
  load_and_authorize_resource
  has_scope :by_user, :default => 1
  actions :all, :except => [:update]

  def show
    @factors = Factors.all
  end

  def edit
    
  end
end
