class ConverterController < ApplicationController

  def upload

    @storage = Storage.create storage_params
    # @storage.media.attach(params[:media])

    Converter.new.convert(@storage.media)

    # ConvertVideoJob.perform_later(movie.path, gif_path)
    respond_to do |format|
      format.html {render "index"}
      format.js
    end
  end

  private
    def storage_params
      params.permit(:media)
    end
end