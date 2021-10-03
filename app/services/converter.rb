class Converter
  require 'streamio-ffmpeg'

  def convert(media)
    gif_path = "tmp/file.gif"
    media.open do |file|
      video = FFMPEG::Movie.new(file.path)
      options = {frame_rate: 5}
      video.transcode(gif_path, options)
      media.attach(io: File.open(gif_path),filename: "file.gif")
    end
  end
end