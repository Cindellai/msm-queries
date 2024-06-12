class ActorsController < ApplicationController
  def index
    @actors = Actor.all
    render({ :template => "actor_templates/list" })
  end

  def show
    @actor = Actor.find(params[:id])
    @characters = @actor.characters
    @movies = @actor.movies.includes(:director)
    render({ :template => "actor_templates/details" })
  end
end
