class MoviesController < ApplicationController
  def index
    @movies = Movie.includes(:director).all
    render({ :template => "movie_templates/list" })
  end

  def show
    @movie = Movie.find(params[:the_id])
    @the_director = @movie.director
    render({ :template => "movie_templates/details" })
  end
end
