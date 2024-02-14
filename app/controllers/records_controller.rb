class RecordsController < ApplicationController
  before_action :set_current_item, only: [:index, :create]

  def index
    @record_address = RecordAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @record_address = RecordAddress.new(record_params)
    if @record_address.valid?
      @record_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_current_item
    @item = Item.find(params[:item_id])
  end

  def record_params
    params.require(:record_address).permit(:postal_code, :region_id, :city, :house_number, :building_name,
                                           :phone_number).merge(user_id: current_user.id, item_id: current_item_id)
  end

  def current_item_id
    @item.id
  end
end
