class VideosController < ApplicationController
  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @video = Video.find(params[:id])
  end

  # GET /videos/new
  # GET /videos/new.json
  def new
    @user = User.find(params[:user_id])
    @video = @user.videos.build
  end

  # GET /videos/1/edit
  def edit
    @video = Video.find(params[:id])
    @user = User.find(@video.user_id)
  end

  # POST /videos
  # POST /videos.json
  def create
    @user = User.find(params[:user_id])
    @video = @user.videos.build(params[:video])
    if @video.save
      flash[:notice] = "Successfully created video."
      redirect_to video_dashboard_url
    else
      render :action => 'new'
    end
  end

  # PUT /videos/1
  # PUT /videos/1.json
  def update
    @video = Video.find(params[:id])
    if @video.update_attributes(params[:video])
      flash[:notice] = "Successfully updated video."
      redirect_to video_dashboard_url
    else
      render :action => 'edit'
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    flash[:notice] = "Successfully destroyed video."
    redirect_to video_dashboard_url
  end

end
