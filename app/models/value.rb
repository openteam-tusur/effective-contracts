class Value < ActiveRecord::Base
   attr_accessible :name, :lecturers_attributes
   belongs_to :factors
   has_many :connections
   has_many :lecturers, through: :connections
   accepts_nested_attributes_for :lecturers
end
