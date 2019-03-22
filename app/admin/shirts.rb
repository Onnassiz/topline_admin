ActiveAdmin.register Shirt do
  permit_params :name, :price, :in_stock, :image, :brand_id
  
  index do
    selectable_column
    column :name
    column :price
    column :in_stock
    column :brand
    column :image, sortable: :image_file_name do |shirt|
      link_to shirt.image_file_name, shirt.image.url
    end
    column :created_at
    # column :image_file_size, sortable: :image_file_size do |firmware| "#{firmware.image_file_size / 1024} KB" end
    # column "Version" do |firmware| "#{firmware.major_version}.#{firmware.minor_version}.#{firmware.patch_version}" end
    # column :created_at
    actions
  end

  form do |f|
    f.inputs 'Shirt' do
      f.input :name, required: true
      f.input :price, required: true
      f.input :in_stock, required: true
      f.input :brand, required: true
      f.input :image, required: true, as: :file
    end
    f.actions
  end
end
