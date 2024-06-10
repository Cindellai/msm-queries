class DirectorsController < ApplicationController
  def index
    @directors = Director.all
    render({ :template => "director_templates/list" })
  end

  def show
    id = params.fetch("id")
    @the_director  = Director.find(id)
    @matching_movies = Movie.where(director_id: @the_director)
    render({ :template => "director_templates/details" })
  end
end
   