ActiveAdmin.register Location do
  permit_params :country
  form title: 'Location' do |f|
    f.inputs 'Country' do
      f.input :country, :as => :country
    end
    f.actions
  end

  index do
    column :country do |country|
      raw "<a href='/admin/locations/#{country.id}'>#{ISO3166::Country[country.country].name}</a>"
    end
    column :created_at
    column :updated_at
    actions
  end
end
