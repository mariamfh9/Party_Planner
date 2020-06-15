class Party < ApplicationRecord 
    belongs_to :host
    belongs_to :category 
    has_many :party_items
    validates :title, presence: true 
    validates :category, presence: true 
    validates :date, presence: true

    accepts_nested_attributes_for :category, reject_if: :all_blank
end 