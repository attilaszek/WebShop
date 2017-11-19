ActiveAdmin.register Characteristic do
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

  belongs_to :sub_category

  permit_params :name, :sub_category_id

  breadcrumb do
    [
      link_to('admin', '/admin/'),
      link_to('Categories', '/admin/categories'),
      link_to(sub_category.category.name, admin_category_sub_categories_path(sub_category.category.id)) + " / " + sub_category.name
    ]
  end

  index do
    h2 link_to(sub_category.category.name, admin_category_sub_categories_path(sub_category.category.id)) + " / " + sub_category.name
    column :id
    column :name
    column :sub_category
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
