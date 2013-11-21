class SearchController < ApplicationController
  def index
    @results = Lecturer.where(author: params[:form][:search]).first
    @users=Hash.new
    @factors=Factor.all
    @factors.each do |factor|
      @users[factor.id]=User.where(id: factor.user_id).first
    end
    unless @results.nil?
      @temp4=Hash.new
      @temp=Lecturer.where(@results.id).first
      @temp1=@temp.connections
      i=0
      a=Array.new
      @temp1.each do |t1|
        a[i]=t1.value_id
        i=i+1
      end
      temp3=Value.where(id: a)
      factors=Factor.all
      factors.each do |f|
        @temp4[f.id]=temp3.where(factor_id: f.id)
      end
    end
  end
end
