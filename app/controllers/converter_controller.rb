class ConverterController < ApplicationController

  def upload
    @storage = Storage.create storage_params

    # ConvertVideoJob.perform_later(@storage.id) #ignore active job
    # sleep 10
    
    Converter.new.convert(@storage.id)
    @storage.reload

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