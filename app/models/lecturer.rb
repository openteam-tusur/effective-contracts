class Lecturer < ActiveRecord::Base
  attr_accessible :author
  has_many :connections
end
