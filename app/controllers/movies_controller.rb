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
  
##### OLD CREATE METHOD  
#  def create
#    @movie = Movie.create!(movie_params)
#    flash[:notice] = "#{@movie.title} was successfully created."
#    redirect_to movies_path
#  end
  
  def create
    @movie = Movie.new(params[:movie])
    if @movie.save
      flash[:notice] = "#{@movie.title} was successfully created."
      redirect_to movies_path
    else
      render 'new' # note, 'new' template can access @movie's field values!
    end 
  end

### OLD UPDATE
#  def update
#    @movie = Movie.find params[:id]
#    @movie.update_attributes(movie_params)
#   flash[:notice] = "#{@movie.title} was successfully updated."
#    redirect_to movies_path
#  end 

# replaces the 'update' method in controller:
  def update
    @movie = Movie.find params[:id]
    if @movie.update_attributes(params[:movie])
      flash[:notice] = "#{@movie.title} was successfully updated."
      redirect_to movie_path(@movie)
    else
      render 'edit' # note, 'edit' template can access @movie's field values!
    end
  end

# as a reminder, here is the original 'new' method:
  def new
    @movie = Movie.new
  end
  
  def edit
    @movie = Movie.find params[:id]
  end 
  
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "#{@movie.title} was successfully deleted."
    redirect_to movies_path
  end
  
end