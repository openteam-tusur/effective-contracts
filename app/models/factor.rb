class Factor < ActiveRecord::Base
  attr_accessible :slug, :title, :abbr, :grade, :user_id
  belongs_to :user
end
