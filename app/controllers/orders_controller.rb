class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :approve, :cancel, :assign, :pick_up, :deliver]
  before_action :set_customer, only: [:create, :new, :edit,  :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all.order(created_at: :desc)
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
    @order.reservation = Time.new.strftime("%H%M%m%d%Y")
    @order.status = "Pending / Contract sent"
    @order.balance_on_delivery = @order.driver_pay
    tax = Float(@order.tax/100) 
    @order.grand_total = @order.booking_deposit + (@order.driver_pay * (1 + tax))
 
    @order.customer_id = @customer.id
    respond_to do |format|
      if @order.save
          if TwilioConf.last.status 
            send_sms(@customer.cell_phone, "Hi "+@customer.name+", you just got a contract from Red Foot Haulers, please check your email!")
          end
        OrderMailer.new_contract(@order).deliver_later
        format.html { redirect_to customers_path, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def on_hold
    @orders = Order.where(status:"Pending / Contract sent").order(created_at: :desc)
  end

  def approve
    @order.status = "Dispatch"
    @order.save
  end

  def cancel
    @order.status = "Cancelled"
    @order.save
  end

  def dispatch_room
    @orders = Order.where(status: "Dispatch").order(created_at: :desc)
  end

  def assign
    respond_to do |format|
      if order.update(order_params)
        format.js
      end
    end
  end

  def my_orders
    @orders = Order.where(["driver_id = ? and status= ? or status=?"," 1", "Assigned", "In Transit"] )
    
    #@orders = Order.where(driver_id: 1)
  end

  def pick_up
    @order.status = "In Transit"
    @order.pick_up_date = Date.today
    @order.save
    #@order.delivery_date =@order.pick_up_date + @order.transit_time
  end

  def deliver
    @order.status = "Delivered"
    @order.delivery_date = Date.today
    @order.save
    #@order.delivery_date =@order.pick_up_date + @order.transit_time
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to customers_path, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
        if format.js 
          puts "envia email"
        end
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
      params.require(:order).permit(:customer_id, :driver_id, :service_type_id, :transport_type_id, :reservation, :direction, :pickup_address, :pickup_contact, :delivery_address, :delivery_contact, :transit_time, :booking_deposit, :balance_on_delivery, :grand_total, :tax, :year_make_model, :color, :vin, :plate, :condition, :estimated_pickup_date, :driver_pay, :security_question, :security_password, :shipping_from_province, :shipping_from_city, :shipping_to_province, :shipping_to_city, :notes, :no_runner, :status)
    end
end
