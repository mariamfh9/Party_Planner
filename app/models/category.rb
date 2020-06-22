class Category < ApplicationRecord
    has_many :parties, :dependent => :destroy 
    has_many :users, through: :parties 
    #validates :name, presence: true
    
end 