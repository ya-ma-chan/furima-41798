class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  private

  def message_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_days_id, :price, :image).merge(user_id: current_user.id)
  end
end
