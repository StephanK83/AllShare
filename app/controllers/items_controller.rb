class ItemsController < ApplicationController

  def index
    if params[:query].present?
      @items = policy_scope(Item).search_by_name_and_category(params[:query])
    else
      @items = policy_scope(Item).all
    end

    @markers = @items.geocoded.map do |item|
      {
        lat: item.latitude,
        lng: item.longitude
      }
    end
  end

  def my_items
    @my_items = Item.where(user: current_user)
    authorize @my_items
  end

  def my_favorite_items
    @my_favorite_items = current_user.all_favorites
    authorize @my_favorite_items
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
      ItemMailer.confirmation(@item.user).deliver_now
      redirect_to item_path(@item)
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

  def toggle_favorite
    @item = Item.find(params[:id])
    current_user.favorited?(@item) ? current_user.unfavorite(@item) : current_user.favorite(@item)
  end

  private

  def item_params
    params.require(:item).permit(
      :category, :name, :description, :postal_code, :quantity, :min_days_rent, :price, photos: []
    )
  end
end
