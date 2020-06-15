class Category < ApplicationRecord
    has_many :parties
    has_many :party_items, through: :parties
    validates :name, presence: true
    validates :name, uniqueness: true 

    
end 