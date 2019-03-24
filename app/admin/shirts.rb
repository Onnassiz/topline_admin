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

  action_item :publish, only: :show do
    link_to "Unpublish", toggle_publish_admin_shirt_path(shirt), method: :put if shirt.in_stock?
  end

  action_item :publish, only: :show do
    link_to "Publish", toggle_publish_admin_shirt_path(shirt), method: :put unless shirt.in_stock?
  end

  member_action :toggle_publish, method: :put do
    shirt = Shirt.find(params[:id])
    shirt.in_stock = !shirt.in_stock
    shirt.save
    redirect_to admin_shirt_path(shirt)
  end
end
