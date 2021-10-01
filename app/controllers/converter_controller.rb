class ConverterController < ApplicationController
  def index
    @movie = Movie.find(1)
  end
  def create
    movie = Movie.create movie_params
  end

  private
    def movie_params
      params.permit(:file)
    end
end