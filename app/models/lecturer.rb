class Lecturer < ActiveRecord::Base
  attr_accessible :author, :connections_attributes
  has_many :connections
  has_many :values, through: :connections
  accepts_nested_attributes_for :connections
end
