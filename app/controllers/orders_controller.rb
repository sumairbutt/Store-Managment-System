class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy complete_order ]
  before_action :create_order, only: %i[create]
  before_action :initiate_order, only: %i[update_cart]
  before_action :set_order_items, only: %i[destroy]

  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)
    respond_to do |format|
      if @order.save
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_cart
    @current_order.order_items.create(item_id: params["id"])
    redirect_to menus_path
    
  end

  def complete_order
    respond_to do |format|
      if @order.update(status: "completed")
        format.html { redirect_to order_path(id: @order.id, print: true)}
      else
        format.html { redirect_to menus_path, notice: "Something went wrong" }
      end
    end
  end


  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order_items.destroy_all
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_order_items
    @order_items = OrderItem.where(order_id: params[:id])
  end

    def generate_order_number
      rand(999999)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.permit(:status, :order_number,  item_ids:[])
    end
end
