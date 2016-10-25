class Quote < ActiveRecord::Base
    validates :quantity, presence: true
                        
    
    validates :heightunits, presence: true,
                        :inclusion => 0..40
   
    
    validates :widthunits, presence: true,
                        :inclusion => 0..40
    
    validates :lengthunit, presence: true,
                        :inclusion => 0..40
    
    validates :weightunits, presence: true,
                        :inclusion => 0..40
    
end
