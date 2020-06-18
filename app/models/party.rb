class Party < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :todos

    validates :title, presence: true
    validates :category, presence:true
    validates :date, presence:true
    
    
end 