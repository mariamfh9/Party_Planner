class Host < ApplicationRecord
    has_secure_password
    has_many :parties
    has_many :categories, through: :parties 
    validates  :username, :email, presence: true, uniqueness: true
    validates :name, :password_digest, presence: true
end 