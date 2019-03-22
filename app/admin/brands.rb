ActiveAdmin.register Brand do
  permit_params :brand, :location_id
  index as: :grid, columns: 5 do |brand|
    div class: 'center' do
      resource_selection_cell brand
    end
    div class: 'center' do
      image = 'https://res.cloudinary.com/onnassiz/image/upload/c_scale,w_146/v1552409115/Brand_day38r.png'
      link_to image_tag(image), admin_brand_path(brand)
    end
    div class: 'center' do
      a truncate(brand.brand), href: admin_brand_path(brand)
    end
  end
end
