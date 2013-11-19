class Value < ActiveRecord::Base
   attr_accessible :title, :body
   belongs_to :factors
   has_many :connections
end
