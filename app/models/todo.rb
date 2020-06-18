class Todo < ApplicationRecord
    belongs_to :party
    accepts_nested_attributes_for :party, reject_if: :all_blank
end 