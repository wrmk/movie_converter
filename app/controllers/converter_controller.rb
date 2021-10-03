class ConverterController < ApplicationController

  def upload
    @gif_name = SecureRandom.alphanumeric(12)
    gif_path = "app/assets/images/#{@gif_name}.gif"
    ConvertVideoJob.perform_later(params[:movie].path, gif_path)
    # show_gif
  end

  def show_gif
    respond_to do |format|
      format.html {render "index"}
      format.js
    end     
  end

  private
    def movie_params
      params.permit(:movie)
    end
end