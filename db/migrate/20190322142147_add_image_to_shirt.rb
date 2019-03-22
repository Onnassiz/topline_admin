class AddImageToShirt < ActiveRecord::Migration[5.2]
  def change
    add_attachment :shirts, :image
  end
end
