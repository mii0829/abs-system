class ListsController < ApplicationController
  before_action :set_list, only: %i[ show update destroy ]

  # GET /lists
  def index
    @lists = List.all
    render json: @lists
  end

  # GET /lists/1
  def show
    render json: @list
  end

  # POST /lists
  def create
    @list = List.new(list_params)

    if @list.save
      render json: @list, status: :created, location: @list
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lists/1
  def update
    if @list.update(list_params)
      render json: @list
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lists/1
  def destroy
    @list.destroy!
  end

  # GET /lists/tag/:tag_id
  def tag
    @lists = List.where(tag_id: params[:tag_id])
    render json: @lists
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = List.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def list_params
    params.require(:list).permit(:name, :detail, :image, :usable, :tag_id)
  end
end
