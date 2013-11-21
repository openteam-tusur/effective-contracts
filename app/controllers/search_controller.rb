class SearchController < ApplicationController
  def index
    @results = Lecturer.where(author: params[:form][:search]).first
    @users=Hash.new
    @factors=Factor.all
    @factors.each do |factor|
      @users[factor.id]=User.where(id: factor.user_id).first
    end

    @temp3=Hash.new
    @temp=Lecturer.find(@results.id)
    @temp1=@temp.connections
    @temp1.each do |t1|
      temp4=Value.where(id: t1.value_id).first
      @temp3[temp4.factor_id]=temp4
    end
  end
end
