class Blog < ApplicationRecord
  belongs_to :user
  has_many :blog_categories
  has_many :categories, through: :blog_categories
  validates :title, presence: true, length: { minimum: 2, maximum: 100}
  validates :content, presence: true, length: { minimum: 8, maximum: 300}
end
