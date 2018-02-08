class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_customer, only: [:show,:create, :new, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.customer_id = @customer.id
    respond_to do |format|
      if @order.save
        send_sms(@customer.cell_phone)
        OrderMailer.new_contract(@order).deliver_later
        format.html { redirect_to customer_path(@customer.id), notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to customer_path(@customer.id), notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to customer_path(@customer.id), notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    def set_customer
      @customer = Customer.find(params[:customer_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:customer_id, :driver_id, :service_type_id, :transport_type_id, :reservation, :direction, :pickup_address, :pickup_contact, :delivery_address, :delivery_contact, :transit_time, :booking_deposit, :balance_on_delivery, :grand_total, :tax, :year_make_model, :color, :vin, :plate, :condition, :estimated_pickup_date, :driver_pay, :security_question, :security_password, :shipping_from_province, :shipping_from_city, :shipping_to_province, :shipping_to_city, :notes, :no_runner)
    end
end
