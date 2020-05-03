class Blog < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2, maximum: 100}
  validates :content, presence: true, length: { minimum: 8, maximum: 300}
  validates :author, presence: true, length: { minimum: 2, maximum: 100}
end
