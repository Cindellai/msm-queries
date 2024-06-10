class DirectorsController < ApplicationController
  def index
    @directors = Director.all
    render({ :template => "director_templates/list" })
  end

  def show
    @director = Director.find(params[:id])
    render({ :template => "director_templates/show" })
  end
end
   