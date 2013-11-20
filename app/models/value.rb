class Value < ActiveRecord::Base
   attr_accessible :name
   belongs_to :factors
   has_many :connections
end
