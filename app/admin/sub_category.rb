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
    h2 category.name
    column :id
    column :name
    column do |sub_category|
      link_to("Products", admin_sub_category_products_path(sub_category))
    end
    column do |sub_category|
      link_to("Characteristics", admin_sub_category_characteristics_path(sub_category))
    end
    column :category
    column :created_at
    column :updated_at
    actions
  end

  controller do
    def create
      super do |format|
        redirect_to collection_url and return if resource.valid?
      end
    end

    def update
      super do |format|
        redirect_to collection_url and return if resource.valid?
      end
    end
  end

end
