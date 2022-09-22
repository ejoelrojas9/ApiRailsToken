class Api::V1::ManagersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_api_v1_manager, only: %i[ show update destroy ]

  # GET /api/v1/managers
  def index
    @api_v1_managers = Api::V1::Manager.all

    render json: @api_v1_managers
  end

  # GET /api/v1/managers/1
  def show
    render json: @api_v1_manager
  end

  # POST /api/v1/managers
  def create
    @api_v1_manager = Api::V1::Manager.new(api_v1_manager_params)

    if @api_v1_manager.save
      render json: @api_v1_manager, status: :created, location: @api_v1_manager
    else
      render json: @api_v1_manager.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/managers/1
  def update
    if @api_v1_manager.update(api_v1_manager_params)
      render json: @api_v1_manager
    else
      render json: @api_v1_manager.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/managers/1
  def destroy
    @api_v1_manager.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_manager
      @api_v1_manager = Api::V1::Manager.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_manager_params
      params.require(:api_v1_manager).permit(:first_name, :last_name, :notes)
    end
end
