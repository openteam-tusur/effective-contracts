class Connection < ActiveRecord::Base
  attr_accessible :lecturer_id, :value_id
  belongs_to :lecturers
  belongs_to :values
end
