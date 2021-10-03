class ConverterController < ApplicationController

  def upload
    @storage = Storage.create storage_params

    ConvertVideoJob.perform_later(@storage.id)
    sleep 10
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