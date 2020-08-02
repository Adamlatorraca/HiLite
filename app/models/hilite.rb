class Hilite < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :comments
  has_many :users, through: :comments

  accepts_nested_attributes_for :user, :category

  validates_presence_of :title
  validates_presence_of :category
  validates_presence_of :content
  validates_uniqueness_of :content
end
