class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :destroy]
  before_action :authenticate_user!

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.joins(:order_items).where(order_items: {user_id: current_user.id}).distinct
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new

    @order.order_items = OrderItem.where("order_id IS ?", nil)
    @addresses = Address.where("user_id = ?", current_user.id)
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.completed = false
    @order.order_items.each do |item|
      item.price = item.product.real_price
      item.save
    end

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:address_id, :completed, {order_items_attributes: [:price, :quantity, :product_id, :user_id, :id, :_destroy]})
    end
end
