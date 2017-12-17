class ProductsController < ApplicationController
  def index
    @categories = Category.all
    if params[:sub_category_id].present?
      @active_sub_category_id = params[:sub_category_id]
      @active_category_id = SubCategory.find(@active_sub_category_id).category_id


      @products = Product.where(:sub_category_id => params[:sub_category_id])
      @searchable_characteristics = Characteristic.
        where(:sub_category_id => params[:sub_category_id]).
        where(:allow_search => true)
    else
      @products = Product.all
      @searchable_characteristics = []
    end

    if params[:search_param].present?
      search_params = params[:search_param]
      search_params.each do |characteristic_id|
        if search_params[characteristic_id].present?
          @products = @products.find_all { |product|
            product.has_characteristic? characteristic_id.to_i and
            product.valid_characteristic? characteristic_id.to_i, search_params[characteristic_id]
          }
        end
      end
    end
  end

  def show
    @categories = Category.all
    if params[:sub_category_id].present?
      @active_sub_category_id = params[:sub_category_id]
      @active_category_id = SubCategory.find(@active_sub_category_id).category_id
    end

    @product = Product.find(params[:id])
    @product_characteristics = ProductCharacteristic.where(:product_id => @product.id)
  end

  private
    def address_params
      params.require(:product).permit(:sub_category_id)
    end
end
