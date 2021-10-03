class ConvertVideoJob < ApplicationJob
  queue_as :default

  def perform(movie_path,gif_path)
    Converter.new.convert(movie_path,gif_path)
  end
end
