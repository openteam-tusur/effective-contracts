class Connection < ActiveRecord::Base
  attr_accessible :title, :body
  belongs_to :lecturers
  belongs_to :values
end
