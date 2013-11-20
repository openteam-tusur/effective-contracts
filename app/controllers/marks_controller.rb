class MarksController < ApplicationController
  def index
    user = User.find(current_user.id)
    @factors = user.factors
  end

  def edit
    f=Factor.find(params[:id])
    v=f.values.create(name: params[:title])
    l=Lecturer.create(author: params[:author])
    l.connections.create(value_id: v.id)
  end
end
