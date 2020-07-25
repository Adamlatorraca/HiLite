class Hilite < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :user, allow_destroy: true
end
