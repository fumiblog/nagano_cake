class Admins::ItemsController < ApplicationController

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    # binding.pry
    @item.save
    redirect_to admins_items_path
  end

  def index
    @items = Item.all
    @genres = Genre.all
    # binding.pry
  end

  def show
    @item = Item.find(params[:id])
    # binding.pry
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
    # binding.pry
  end

  def update
    @item = Item.find(params[:id])
    # binding.pry
    @item.update(item_params)
    # binding.pry
    redirect_to admins_items_path
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to admins_items_path
  end

  private
  def item_params
    params.require(:item).permit(
      :image,
      :name,
      :introduction,
      :genre_id,
      :price,
      :is_active)
  end

end
