class ItemsController < ApplicationController

before_action :require_sign_in

  def create
    @user = current_user
    @item = @user.items.new(item_params)
    @item.completed = false

    if @item.save
      flash[:notice] = "You made a new item!"
    else
      flash[:alert] = "There was an error creating this item."
    end
    redirect_to users_show
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
