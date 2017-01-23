class ItemsController < ApplicationController

  def create
    @item = Item.new
    @item.name = params[:item][:name]
    @item.user_id = current_user.id
    @item.completed = false

    if @item.save
      flash[:notice] = "You made a new item!"
    else
      flash[:alert] = "There was an error creating this item."
    end

    redirect_to current_user
  end
end
