class ConverterController < ApplicationController
  require 'streamio-ffmpeg'

  def index
  end
  
  def upload
    if movie = Movie.find_by(id: 1)
      movie.file.attach(params[:file])
    else
      movie = Movie.create movie_params
    end
    movie.file.open do |file|
      path = "tmp/file.gif"
      video = FFMPEG::Movie.new(file.path)
      video.transcode(path,frame_rate: '10')
      movie.file.attach(io: File.open(path),filename: "file.gif")
    end
    @gif = movie.file
    respond_to do |format|
      format.html {render "index"}
      format.js
    end    
  end

  private
    def movie_params
      params.permit(:file)
    end
end