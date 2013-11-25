class LecturersController < ApplicationController
  def create
    params[:lecturer][:values_attributes].each do |f,b|
      puts b[:name]
    end
  end
end
