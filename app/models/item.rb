class Item < ApplicationRecord
  belongs_to :user
  has_many :item_categories
  has_many :categories, through: :item_categories
  #searchkick
  validates :question, :answer, presence: true
end
