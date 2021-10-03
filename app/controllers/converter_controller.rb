class ConverterController < ApplicationController
  require 'streamio-ffmpeg'

  def index
  end

  def upload
    @gif_path = "app/assets/images/file.gif"
    video = FFMPEG::Movie.new(params[:file].path)
    options = {frame_rate: '5'}
    video.transcode(@gif_path, options)
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