class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :require_owner, only: [:edit, :update]
  before_action :find_item, only: [:show, :edit, :update]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:commodity, :description, :category_id, :condition_id, :payer_id, :region_id, :shipping_day_id,
                                 :price, :image)
  end

  def require_owner
    @item = Item.find(params[:id])
    return if current_user == @item.user

    redirect_to root_path
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
