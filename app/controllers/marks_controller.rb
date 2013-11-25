class MarksController < ApplicationController
  def index
    user = User.find(current_user.id)
    @factors = user.factors
    @values=Hash.new
    @lecturers = Hash.new
    @factors.each do |f|
      @values[f.id] = f.values
      temp=f.values
      temp.each do |t|
        temp1=t.connections
        i=0
        a=Array.new
        temp1.each do |t1|
          a[i]=t1.lecturer_id
          i = i + 1
        end
        @lecturers[t.id]=Lecturer.where(id: a)
      end
    end
    @l = Lecturer.new
  end

  def edit
    f=Factor.find(params[:id])
    v = f.values.create(name: params[:value][:name])
    params[:value][:lecturers_attributes].each do |temp, names|
      search = Lecturer.where(author: names[:author])
      if search.count == 0 
        l = Lecturer.create(author: names[:author])
        l.connections.create(value_id: v.id)
      else
        search.first.connections.create(value_id: v.id)
      end
    end
    redirect_to action: :index
  end
  
  def show
    @v = Value.where(factor_id: params[:id]) # -> name
  end
end
