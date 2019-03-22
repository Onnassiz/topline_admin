class Brand < ApplicationRecord
  belongs_to :location
  validates :brand, presence: true

  def to_s
    brand
  end
end
