class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :hilite
  accepts_nested_attributes_for :user
end
