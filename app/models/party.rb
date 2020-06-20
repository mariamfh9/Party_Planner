class Party < ApplicationRecord
    belongs_to :user
    belongs_to :category
    validates :title, presence: true
    validates :title, uniqueness: true
    validates :category, presence: true
    validates :todos, presence: true 
    validates :date, presence: true
    validates :time, presence: true 
 
    accepts_nested_attributes_for :category, reject_if: proc { |attributes| attributes['name'].nil? }, allow_destroy: true


end 