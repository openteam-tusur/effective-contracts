class Connection < ActiveRecord::Base
  attr_accessible :lecturer_id, :value_id
  belongs_to :lecturer
  belongs_to :value
end
