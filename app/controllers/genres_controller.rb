class GenresController < ApplicationController

  def index
    @genres = Genre.all
    # @genre = Genre.new(genre_params)
    # binding.pry
  end

  def create
    @genre = Genre.new(params[:id])
    # binding.pry
    @genre.save(genre_params)
    redirect_to genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to genres_path
  end

  private
  def genre_params
    params.require(:genre).permit(:name, :is_active) #params.require(:genre).permit(:name, :is_active)を変更
  end
end
