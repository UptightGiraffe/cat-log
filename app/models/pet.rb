class Pet < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { minimum: 2, maximum: 100}
  validates :description, presence: true, length: { minimum: 8, maximum: 300}
  has_one_attached :photo
end
