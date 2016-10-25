class PickupHistory < ActiveRecord::Base
  validates :condition, presence: true,
            length: {minimum: 5};
            
  validates :pickupid, presence: true
  
  validates :employeeid, presence: true
end
