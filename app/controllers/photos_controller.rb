class PhotosController < ApplicationController
  def index
    per = 20
    @page = (params[:page] || 1).to_i
    @album_id = params[:album_id].to_i
    @photos = Album.find_by(id: @album_id).photos
    if @page > ((@photos.count - 1) / per + 1)
      render plain: 'No more.'
    else
      @photos = Album.find_by(id: @album_id).photos.page(@page).per(per)
      render layout: false
    end
  end
end
