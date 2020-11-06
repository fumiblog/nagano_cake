class ItemsController < ApplicationController

  def new
    @item = Item.new
    # binding.pry
    @genres = Genre.all
  end

  def create
    @item = Item.new
    # binding.pry
    @item.save(item_params)
    redirect_to items_path
  end

  def index
    @items = Item.all
    @genres = Genre.all
    # binding.pry
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
    # binding.pry
  end

  def update
    @item = Item.find(params[:id])
    # binding.pry
    @item.save(item_params)
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).parmit(:image_id, :name, :introduction, :genre_id, :price, :is_active)
  end
end
