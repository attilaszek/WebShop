ActiveAdmin.register SubCategory do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  
  permit_params :name, :category_id
  
  belongs_to :category

  form do |f|
    f.inputs do
      f.input :name
      f.actions
    end
  end

  index do
    column :id
    column :name do |sub_category|
      link_to(sub_category.name, admin_sub_category_products_path(sub_category))
    end
    column :category
    column :created_at
    column :updated_at
    actions
  end

end
