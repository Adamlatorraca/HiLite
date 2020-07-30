class Category < ApplicationRecord
    has_many :hilites
    validates :name, presence: :true 
    validates_uniqueness_of :name, message: "that category has already been created."
end
