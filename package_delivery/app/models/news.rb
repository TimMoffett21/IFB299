class News < ActiveRecord::Base
   def self.search(search)
      if search != ""
         self.where("title =?",search)
      else
         self.all
      end
   end
   validates :title, presence: true, length: {maximum:50},uniqueness: { case_sensitive: false }
  validates :content, presence: true, length: {maximum: 1000}
end
