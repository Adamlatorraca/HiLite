class User < ApplicationRecord
    has_many :hilites
    has_many :categories, through: :hilites
    has_many :comments
    has_many :commented_posts, through: :comments, source: :hilite
    has_secure_password
end
