# This file is app/controllers/movies_controller.rb

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end
  
  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end
  
  def new
    
  end
  
  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end
  
  def edit
    @movie = Movie.find params[:id]
  end 

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movies_path
  end 
  
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "#{@movie.title} was successfully deleted."
    redirect_to movies_path
  end
  
end