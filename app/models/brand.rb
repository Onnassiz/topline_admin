class Brand < ApplicationRecord
  belongs_to :location
  validates :brand, presence: true
end
