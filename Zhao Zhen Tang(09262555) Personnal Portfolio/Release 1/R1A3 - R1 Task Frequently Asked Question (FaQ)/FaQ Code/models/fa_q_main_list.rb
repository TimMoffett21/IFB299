class FaQMainList < ActiveRecord::Base
  has_many :fa_q_sub_lists
  
  validates :FaqMainName , presence: true, uniqueness: true
  
end
