class DirectorsController < ApplicationController
  def index
    @directors = Director.all
    render({ :template => "director_templates/list" })
  end

  def eldest
    @eldest_director = Director.where.not({ :dob => nil }).order({ :dob => :asc }).first
    Rails.logger.debug "Eldest Director: #{@eldest_director.name}"
    render({ :template => "director_templates/eldest" })
  end
  
  def youngest
    @youngest_director = Director.where.not({ :dob => nil }).order({ :dob => :desc }).first
    Rails.logger.debug "Youngest Director: #{@youngest_director.name}"
    render({ :template => "director_templates/youngest" })
  end
  
  def show
    id = params.fetch("id")
    @the_director = Director.find(id)
    @matching_movies = Movie.where({ :director_id => @the_director.id })
    render({ :template => "director_templates/details" })
  end
end
