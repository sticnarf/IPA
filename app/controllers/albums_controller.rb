class AlbumsController < ApplicationController
  def index
    redirect_to album_url(Album.last)
  end

  def show
    @album = Album.find_by(id: params[:id])
    page = (Album.where('priority > ? OR id >= ?', @album.priority, @album.id).count + 4) / 5
    @albums = Album.order(priority: :desc, id: :desc).page(page).per(5)
  end

  def side
    @album = Album.find_by(id: params[:id])
    @albums = Album.order(priority: :desc, id: :desc).page(params[:page]).per(5)
    respond_to do |format|
      format.html { render layout: false }
    end
  end
end
