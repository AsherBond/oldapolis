class SongsController < ApplicationController
  def index
    @album = Album.find(params[:album_id])
    @artist = User.find(@album.user_id)
    @songs = @album.songs
    render :layout => "song-application"
  end
  
  def new
    @album = Album.find(params[:album_id])
    @song = @album.songs.build
  end
  
  def create
    @album = Album.find(params[:album_id])
    @song = @album.songs.build(params[:song])
    if @song.save
      flash[:notice] = "Successfully created song."
      redirect_to user_album_songs_path(current_user, @album)
    else
      render :action => 'index'
    end
  end
  
  def edit
    @song = Song.find(params[:id])
    @album = Album.find(@song.album_id)
    @artist = User.find(@album.user_id)
  end
  
  def update
    @song = Song.find(params[:id])
    if @song.update_attributes(params[:song])
      flash[:notice] = "Successfully updated song."
      redirect_to album_songs_path(@song.album)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Successfully destroyed song."
    redirect_to album_songs_path(@song.album)
  end


end