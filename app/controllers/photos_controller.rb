class PhotosController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @photos = @user.photos
  end
  
  def new
    @user = User.find(params[:user_id])
    @photo = @user.photos.build
  end
  
  def create
    @user = User.find(params[:user_id])
    @photo = @user.photos.build(params[:photo])
    if @photo.save
      flash[:notice] = "Successfully created photo."
      redirect_to gallery_dashboard_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @photo = Photo.find(params[:id])
    @user = User.find(@photo.user_id)
  end
  
  def update
    @photo = Photo.find(params[:id])
    if @photo.update_attributes(params[:photo])
      flash[:notice] = "Successfully updated photo."
      redirect_to gallery_dashboard_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = "Successfully destroyed photo."
    redirect_to gallery_dashboard_url
  end


end