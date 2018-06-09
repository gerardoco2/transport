class TwilioConfsController < ApplicationController
  before_action :set_twilio_conf, only: [:show, :edit, :update, :destroy]

  # GET /twilio_confs
  # GET /twilio_confs.json
  def index
    @twilio_confs = TwilioConf.all
  end

  # GET /twilio_confs/1
  # GET /twilio_confs/1.json
  def show
  end

  # GET /twilio_confs/new
  def new
    @twilio_conf = TwilioConf.new
  end

  # GET /twilio_confs/1/edit
  def edit
  end

  # POST /twilio_confs
  # POST /twilio_confs.json
  def create
    @twilio_conf = TwilioConf.new(twilio_conf_params)

    respond_to do |format|
      if @twilio_conf.save
        format.html { redirect_to @twilio_conf, notice: 'Twilio conf was successfully created.' }
        format.json { render :show, status: :created, location: @twilio_conf }
      else
        format.html { render :new }
        format.json { render json: @twilio_conf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /twilio_confs/1
  # PATCH/PUT /twilio_confs/1.json
  def update
    respond_to do |format|
      if @twilio_conf.update(twilio_conf_params)
        format.html { redirect_to @twilio_conf, notice: 'Twilio conf was successfully updated.' }
        format.json { render :show, status: :ok, location: @twilio_conf }
      else
        format.html { render :edit }
        format.json { render json: @twilio_conf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twilio_confs/1
  # DELETE /twilio_confs/1.json
  def destroy
    @twilio_conf.destroy
    respond_to do |format|
      format.html { redirect_to twilio_confs_url, notice: 'Twilio conf was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_twilio_conf
      @twilio_conf = TwilioConf.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def twilio_conf_params
      params.require(:twilio_conf).permit(:acct_id, :auth_token, :phone_number, :status)
    end
end
