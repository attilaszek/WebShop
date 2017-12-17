class WishlistController < ApplicationController
  def new
    (session[:wishlist] ||= []) << params[:product_id]

    redirect_to wishlist_index_path
  end

  def destroy
    session[:wishlist].delete(params[:product_id])

    redirect_to wishlist_index_path
  end

  def index
    @products = Product.where("id in (?)", session[:wishlist])
  end

  private
    def wishlist_params
      params.require(:wishlist).permit(:product_id)
    end
end
