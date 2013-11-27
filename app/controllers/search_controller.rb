#coding: utf-8
require "unicode_utils/titlecase" 
class SearchController < ApplicationController
  def index
    @results = Lecturer.where(author: UnicodeUtils.titlecase(params[:form][:search])).first
    @users=Hash.new
    @factors=Factor.all
    @factors.each do |factor|
      @users[factor.id]=User.where(id: factor.user_id).first
    end

    unless @results.nil?
      @authors=Hash.new
      temp=@results.values
      factors=Factor.all
      factors.each do |f|
        @authors[f.id]=temp.where(factor_id: f.id)
      end
    end
  end
end
