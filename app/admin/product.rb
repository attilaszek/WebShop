ActiveAdmin.register Product do
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

  permit_params :name, :description, :price, :promotion_price, :sub_category_id, :image


  form do |f|
    f.inputs do
      f.input :name
      f.input :image, as: :file
      f.input :description, as: :ckeditor
      f.input :sub_category, :collection => option_groups_from_collection_for_select(Category.all, :sub_categories, :name, :id, :name, f.object.sub_category_id)
      f.input :price
      f.input :promotion_price
      f.actions
    end
  end

  index do
    column :id
    column :name
    column :price
    column :promotion_price
    column :sub_category
    column :created_at
    column :updated_at
    actions
  end

  show do
    h3 product.sub_category.category.name
    table_for product do
      column :name
      column :price
      column :promotion_price
      column :sub_category
    end
    panel "aaaDesc" do
      image_tag product.image.url
    end
    h2
    panel "Desc" do
      p product.description.html_safe
    end
  end

end
