class ConverterController < ApplicationController
  def index
    @movie = Movie.where(id: 1)
  end
  def create
    movie = Movie.create movie_params
    # movie.file.attach(params[:file])
  end

  private
    def movie_params
      params.permit(:file)
    end
end