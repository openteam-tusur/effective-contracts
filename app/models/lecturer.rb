class Lecturer < ActiveRecord::Base
  attr_accessible :title, :body
  has_many :connections
end
