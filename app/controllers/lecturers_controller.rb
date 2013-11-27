#coding: utf-8
require "unicode_utils/titlecase" 
class LecturersController < ApplicationController
  inherit_resources
  load_and_authorize_resource
  actions :index
  layout false
  respond_to :json

  def index
    index! do |format|
      format.json { render :json => custom_json_for(collection) }
    end
  end

  def custom_json_for(value)
    list = value.map do |item|
      { :id => " #{item.id}",
        :label => item.author.to_s,
        :value => item.author.to_s
      }
    end
    list.to_json
  end

  def collection
    super.where("author LIKE ?", "%#{UnicodeUtils.titlecase(params[:term])}%" )
  end

end
