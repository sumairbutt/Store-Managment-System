class OrderHistoriesController < ApplicationController
  before_action :set_order_history, only: %i[ show edit update destroy ]

  # GET /order_histories or /order_histories.json
  def index
    @order_histories = Order.where(status: "completed").paginate(page: params[:page], per_page: 10)
  end

  # GET /order_histories/1 or /order_histories/1.json
  def show
  end

  # GET /order_histories/new
  def new
    @order_history = OrderHistory.new
  end

  # GET /order_histories/1/edit
  def edit
  end

  # POST /order_histories or /order_histories.json
  def create
    @order_history = OrderHistory.new(order_history_params)

    respond_to do |format|
      if @order_history.save
        format.html { redirect_to order_history_url(@order_history), notice: "Order history was successfully created." }
        format.json { render :show, status: :created, location: @order_history }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_histories/1 or /order_histories/1.json
  def update
    respond_to do |format|
      if @order_history.update(order_history_params)
        format.html { redirect_to order_history_url(@order_history), notice: "Order history was successfully updated." }
        format.json { render :show, status: :ok, location: @order_history }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_histories/1 or /order_histories/1.json
  def destroy
    @order_history.destroy!

    respond_to do |format|
      format.html { redirect_to order_histories_url, notice: "Order history was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_history
      @order_history = OrderHistory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_history_params
      params.fetch(:order_history, {})
    end
end
