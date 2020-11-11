class Admins::GenresController < ApplicationController

  def index
    @genres = Genre.all
    @genre = Genre.new
    # binding.pry
  end

  def create
    # binding.pry
    @genre = Genre.new(genre_params)  #ユーザーが入力した値
    
    @genre.save
    redirect_to admins_genres_path
  end

  def edit
    @genre = Genre.find(params[:id])  #探した値
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    # binding.pry
    redirect_to admins_genres_path
  end

  private
  def genre_params
    params.require(:genre).permit(:name, :is_active)
  end
end
