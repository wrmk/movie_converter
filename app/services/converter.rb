module Converter
  require 'streamio-ffmpeg'

  def convert(movie_path,gif_path)
    video = FFMPEG::Movie.new(movie_path)
    options = {frame_rate: 5}
    video.transcode(gif_path, options)
  end
end