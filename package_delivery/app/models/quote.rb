class Quote < ActiveRecord::Base
    validates :quantity, presence: true
                        
    
    validates :height, presence: true,
                        :inclusion => 0..40
   
    
    validates :width, presence: true,
                        :inclusion => 0..40
    
    validates :length, presence: true,
                        :inclusion => 0..40
    
    validates :weight, presence: true,
                        :inclusion => 0..40
    
end
