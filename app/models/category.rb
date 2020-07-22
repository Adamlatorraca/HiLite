class Category < ApplicationRecord
    has_many :hilites
    has_many :users, through: :hilites
end
