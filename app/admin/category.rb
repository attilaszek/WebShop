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

  form do |f|
    f.inputs do
      f.input :name
    end
    f.inputs do
      f.has_many :sub_categories, allow_destroy: true do |s|
        s.input :name
      end
    end
    f.actions
  end

  show do
    panel "Subcateories" do
      table_for category.sub_categories do
        column :id
        column :name
      end
    end
  end

end
