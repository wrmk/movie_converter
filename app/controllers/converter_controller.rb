class ConverterController < ApplicationController
  include Converter

  def upload
    @gif_name = SecureRandom.alphanumeric(12)
    gif_path = "app/assets/images/#{@gif_name}.gif"
    convert(params[:movie].path, gif_path)
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