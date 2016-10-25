class Pickup < ActiveRecord::Base
    validates :name, presence: true,
                    length: { minimum: 5 }
                    
    validates :address, presence: true,
                    length: { minimum: 5 }
                    
    validates :city, presence: true,
                    length: { minimum: 5 }
                    
    validates_format_of :state, :with => /\A[a-zA-Z]+\z/,
    :message => "Only letters allowed", presence: true,
            length: { maximum: 3}
            
    validates_length_of :state, :is => 3, presence: true
                    
    validates_length_of :zip, :is => 4, presence: true
                    
    validates_format_of :country, :with => /\A[a-zA-Z]+\z/,
    :message => "Only letters allowed", presence: true
         
    #needs to be fixed so it accepts a 0 at the start           
    validates_length_of :number, :is => 10, presence: true,
        :too_long => "{{count}} digits is the length of the number"
        
    
    validates :shipment_amount, presence: true,
                    :inclusion => 1..20
                    
    validates :weight, presence: true,
                    :inclusion => 0..40
                    
    validates :package_location, presence: true,
                    length: { minimum: 5 }
                    
    validates_format_of :delivery_type, :with => /\A[a-zA-Z]+\z/,
    :message => "Only letters allowed", presence: true 
    
    validates :totle_cost, presence: true
    
end
