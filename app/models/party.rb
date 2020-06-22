class Party < ApplicationRecord
    belongs_to :user
    belongs_to :category
    validates :title, presence: true
    validates :title, uniqueness: true
    validates :category, presence: true
    validates :todos, presence: true 
    validates :date, presence: true
    validates :time, presence: true 
 
    #accepts_nested_attributes_for :category, reject_if: :all_blank, allow_destroy: true
    scope :alphabet, -> { order(title: :asc) }

    def category_attributes=(category)
        #binding.pry
        if !category = ""
        self.category = Category.find_or_create_by(name: category[:name])

        self.category.update(category)
        end 
    end 

  


    
end 