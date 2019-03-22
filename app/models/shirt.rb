class Shirt < ApplicationRecord
  has_attached_file :image
  belongs_to :brand
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
