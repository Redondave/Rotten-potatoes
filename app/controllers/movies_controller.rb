class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    if params[:sort] == 'title'
      @movies = @movies.order(:title)
    elsif params[:sort] == 'release_date'
      @movies = @movies.order(:release_date)
    end
  end

  def new
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def create
    params.permit!
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
    params.permit!
    @movie.destroy
    redirect_to movies_path, notice: "Movie '#{@movie.title}' was successfully deleted."
  end

  def search_tmdb
    body = find_in_tmdb(params[:search_terms])
    title = body[0]['title'] unless body.nil?
    release_date = body[0]['release_date'] unless body.nil?
    rating = body[0]['vote_average'] unless body.nil?
    description = body[0]['overview'] unless body.nil?
    if title.nil? or title != params[:search_terms]
      redirect_to movies_path, notice: "'#{params[:search_terms]}' was not found on TMDb"
    else
      @movie = Movie.create(title: title, release_date: release_date, rating: rating, description: description)
      redirect_to movies_path, notice: "Movie '#{@movie.title}' was successfully created from TMDb search."
    end
  end

  def movie_params
    params.require(:movie).permit(:title, :release_date, :rating, :description)
  end
end
