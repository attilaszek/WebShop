ActiveAdmin.register Order do
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

  permit_params :completed

  actions :all, :except => [:new, :destroy]

  form do |f|
    order.completed = true
    panel "Are you sure to confirm this order?" do
      f.inputs do
        f.input :completed, as: :hidden
        f.actions
      end
    end
  end

  index do
    column :id do |order|
      link_to(order.id, admin_order_path(order))
    end
    column :created_at
    column :completed
    column :total_price
  end

  show do
    panel "Order items" do
      table_for order.order_items do
        column "name" do |order_item|
          order_item.product.name
        end
        column :price
        column :quantity
        column :total_price
      end
    end
    panel "Order details" do
      table_for order do
        column :created_at
        column :total_price
        column :completed
      end
    end
  end

end
