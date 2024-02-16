class RecordsController < ApplicationController
  before_action :set_current_item, only: [:index, :create]
  before_action :check_login_and_item_owner, only: [:index, :create]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @record_address = RecordAddress.new
  end

  def create
    @record_address = RecordAddress.new(record_params)
    if @record_address.valid?
      pay_item
      @record_address.save
      unless @item.record.present?
        redirect_to root_path
        nil
      end
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_current_item
    @item = Item.find(params[:item_id])
  end

  def record_params
    params.require(:record_address).permit(:postal_code, :region_id, :city, :house_number, :building_name,
                                           :phone_number).merge(user_id: current_user.id, item_id: current_item_id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: record_params[:token],
      currency: 'jpy'
    )
  end

  def current_item_id
    @item.id
  end

  def check_login_and_item_owner
    if user_signed_in?
      redirect_to root_path if current_user == @item.user
    else
      redirect_to new_user_session_path
    end
  end
end
