ActiveAdmin.register Category do
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

  permit_params :name, sub_categories_attributes: [:id, :name, :_destroy]

  show do
    panel "Subcategories" do
      table_for category.sub_categories do
        column :id
        column :name
      end
    end
  end

  index do
    column :id
    column :name do |category|
      link_to(category.name, admin_category_sub_categories_path(category))
    end
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
