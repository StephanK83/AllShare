class ItemsController < ApplicationController

  def index
    @items = policy_scope(Item).all
  end

  def my_items
    @my_items = Item.where(user: current_user)
    authorize @my_items
  end

  def new
    @item = Item.new
    authorize @item
  end

  def show
    @item = Item.find(params[:id])
    @reviews = @item.reviews
    authorize @item
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    authorize @item

    if @item.save
      redirect_to items_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @item = Item.find(params[:id])
    authorize @item
  end

  def update
    @item = Item.find(params[:id])
    authorize @item
    @item.update(item_params)
    redirect_to items_path
  end

  def destroy
    @item = Item.find(params[:id])
    authorize @item
    @item.destroy
    redirect_to items_path, status: :see_other
  end

  private

  def item_params
    params.require(:item).permit(:category, :name, :description, :postal_code, :quantity, :min_days_rent, :price)
  end
end
