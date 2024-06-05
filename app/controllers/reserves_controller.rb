class ReservesController < ApplicationController
  before_action :set_reserf, only: %i[ show update destroy return use ]

  # GET /reserves
  def index
    @reserves = Reserve.all

    render json: @reserves
  end

  # GET /reserves/1
  def show
    render json: @reserf
  end

  # POST /reserves
  # POST /reserves
  def create
    @reserf = Reserve.new(reserf_params)

    if @reserf.save
      # Check if the start date of the reservation matches today's date
      if @reserf.start == Date.today
        @reserf.update(isRenting: 1)
      end

      render json: @reserf, status: :created, location: @reserf
    else
      render json: @reserf.errors, status: :unprocessable_entity
    end
  end


  # PATCH/PUT /reserves/1
  def update
    if @reserf.update(reserf_params)
      render json: @reserf
    else
      render json: @reserf.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reserves/1
  def destroy
    @reserf.destroy!
  end

  def return
    reserve = Reserve.find(params[:id])
    if reserve.update(end: Time.zone.today, isRenting: 3)
      render json: { message: "Return successful" }, status: :ok
    else
      render json: { message: "Return failed" }, status: :unprocessable_entity
    end
  end

  def borrow
    reserve = Reserve.find(params[:id])
    if reserve.update(isRenting: 2)
      render json: { message: "borrow successful" }, status: :ok
    else
      render json: { message: "borrow failed" }, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reserf
      @reserf = Reserve.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reserf_params
      params.require(:reserf).permit(:user_id, :start, :end, :list_id, :isRenting)
    end
end
