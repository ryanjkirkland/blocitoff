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

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy
      flash[:notice] = "IT'S GONE. IT'S ALL GONE."

      respond_to do |format|
        format.html { redirect_to current_user }
        format.js { render :destroy } 
      end

    else
      flash[:alert] = "WE CANNOT BE DESTROYED"
      redirect_to current_user
    end
  end
end
