class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    if params[:sort] == 'title'
      @movies = @movies.order(:title)
    elsif params[:sort] == 'release_date'
      @movies = @movies.order(:release_date)
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def create
    if (@movie = Movie.create(params[:movie]))
      redirect_to movies_path, notice: "Movie '#{@movie.title}' was successfully created."
    else
      flash[alert] = "Movie '#{@movie.title}' could not be created."
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    params.permit!
    if @movie.update(params[:movie])
      redirect_to movies_path, notice: "Movie '#{@movie.title}' was successfully updated."
    else
      flash[alert] = "Movie '#{@movie.title}' could not be updated."
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path, notice: "Movie '#{@movie.title}' was successfully deleted."
  end

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end
end
