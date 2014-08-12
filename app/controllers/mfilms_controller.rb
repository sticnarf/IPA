class MfilmsController < ApplicationController
  def index
    redirect_to mfilm_url(Mfilm.last)
  end

  def show
    @video = Mfilm.find_by(id: params[:id])
    page = (Mfilm.where('priority > ? OR id >= ?', @video.priority, @video.id).count + 4) / 5
    @videos = Mfilm.order(priority: :desc, id: :desc).page(page).per(5)
  end

  def side
    @video = Mfilm.find_by(id: params[:id])
    @videos = Mfilm.order(priority: :desc, id: :desc).page(params[:page]).per(5)
    respond_to do |format|
      format.html { render layout: false }
    end
  end
end
