class VideosController < ApplicationController
  def index
    redirect_to video_url(Video.last)
  end

  def show
    @video = Video.find_by(id: params[:id])
    page = (Video.where('priority > ? OR id >= ?', @video.priority, @video.id).count + 4) / 5
    @videos = Video.order(priority: :desc, id: :desc).page(page).per(5)
  end

  def side
    @video = Video.find_by(id: params[:id])
    @videos = Video.order(priority: :desc, id: :desc).page(params[:page]).per(5)
    respond_to do |format|
      format.html { render layout: false }
    end
  end
end
