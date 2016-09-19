class FaQSubList < ActiveRecord::Base
  belongs_to :fa_q_main_lists
  
  validates :SubFaqQuestion, presence: true, length: {maximum:50}
  
  validates :SubFaqAnswer, presence: true, length: {maximum: 1000}
end
