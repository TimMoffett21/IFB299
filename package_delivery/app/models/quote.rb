class Quote < ActiveRecord::Base
    validates :quantity, presence: true,
                        length: { minimum: 1}
    
    validates :height, presence: true,
                        length: { minimum: 1}
    validates :heightunits, :numericality => {:only_double => true},
    presence: true
    
    validates :width, presence: true,
                        length: { minimum: 1}
    
    validates :length, presence: true,
                        length: { minimum: 1}
    
    validates :weight, presence: true,
                        length: { minimum: 1}
    
end
