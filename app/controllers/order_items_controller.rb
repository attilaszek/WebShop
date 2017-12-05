class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @order_items = OrderItem.where("order_id IS ?", nil)
  end

  # POST /order_items
  # POST /order_items.json
  def create
    @order_item = OrderItem.find_unconfirmed_by_product_and_user(order_item_params[:product_id], current_user.id)
    if @order_item.blank?
      @order_item = OrderItem.new(order_item_params)
      @order_item.user_id = current_user.id
      @order_item.quantity = 1
    else
      @order_item.quantity += 1
    end

    respond_to do |format|
      if @order_item.save
        format.html { redirect_to new_order_path, notice: 'order_item was successfully created.' }
        format.json { render :show, status: :created, location: @order_item }
      else
        format.html { render :new }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_items/1
  # PATCH/PUT /order_items/1.json
  def update
    p "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    respond_to do |format|
      if @order_item.update(order_item_params)
        format.html { redirect_to action: 'index', notice: 'order_item was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_item }
      else
        format.html { render :edit }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy
    @order_item.destroy
    respond_to do |format|
      format.html { redirect_to new_order_path, notice: 'order_item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_item_params
      params.require(:order_item).permit(:price, :quantity, :user_id, :product_id, :order_id)
    end
end
