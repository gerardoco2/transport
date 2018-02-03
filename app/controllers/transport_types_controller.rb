class TransportTypesController < ApplicationController
  before_action :set_transport_type, only: [:show, :edit, :update, :destroy]

  # GET /transport_types
  # GET /transport_types.json
  def index
    @transport_types = TransportType.all
  end

  # GET /transport_types/1
  # GET /transport_types/1.json
  def show
  end

  # GET /transport_types/new
  def new
    @transport_type = TransportType.new
  end

  # GET /transport_types/1/edit
  def edit
  end

  # POST /transport_types
  # POST /transport_types.json
  def create
    @transport_type = TransportType.new(transport_type_params)

    respond_to do |format|
      if @transport_type.save
        format.html { redirect_to @transport_type, notice: 'Transport type was successfully created.' }
        format.json { render :show, status: :created, location: @transport_type }
      else
        format.html { render :new }
        format.json { render json: @transport_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transport_types/1
  # PATCH/PUT /transport_types/1.json
  def update
    respond_to do |format|
      if @transport_type.update(transport_type_params)
        format.html { redirect_to @transport_type, notice: 'Transport type was successfully updated.' }
        format.json { render :show, status: :ok, location: @transport_type }
      else
        format.html { render :edit }
        format.json { render json: @transport_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transport_types/1
  # DELETE /transport_types/1.json
  def destroy
    @transport_type.destroy
    respond_to do |format|
      format.html { redirect_to transport_types_url, notice: 'Transport type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transport_type
      @transport_type = TransportType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transport_type_params
      params.require(:transport_type).permit(:name, :description, :status)
    end
end
