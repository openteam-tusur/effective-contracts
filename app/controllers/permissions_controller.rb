class PermissionsController < ApplicationController
  inherit_resources
  load_and_authorize_resource
  has_scope :by_user, :default => 1
  actions :all, :except => [:show, :edit, :update]
end
