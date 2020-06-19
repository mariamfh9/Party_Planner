class Party < ApplicationRecord
    belongs_to :user
    belongs_to :category
    validates :title, presence: true
    validates :title, uniqueness: true
    validates :category, presence: true
    validates :todos, presence: true 
    validates :date, presence: true
    validates_presence_of :time, :message => "Can't be empty"
        #message: "You cannot leave an empty form."
 
    accepts_nested_attributes_for :category, reject_if: proc { |attributes| attributes['name'].nil? }
end 