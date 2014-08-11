class VideosController < ApplicationController
  def index
    redirect_to video_url(Video.last)
  end

  def show
    @video = Video.find_by(id: params[:id])
    @videos = Video.page(Video.where('id >= ?', @video.id).count / 5 + 1).per(5)
  end
end
