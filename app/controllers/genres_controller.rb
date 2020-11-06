class GenresController < ApplicationController

  def index
    @genres = Genre.all
    @genre = Genre.new
    # binding.pry
  end

  def create
    @genre = Genre.new(genre_params)  #ユーザーが入力した値
    # binding.pry
    @genre.save
    redirect_to genres_path
  end

  def edit
    @genre = Genre.find(params[:id])  #探した値
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
