class PagesController < ApplicationController
  def home
  end

  def about
  end

  def team
  end

  def music
  	@artists = User.order("created_at desc").limit(4)
  	@albums = Album.order("created_at desc").limit(4)
  	gon.users = User.all.map &:artist_name
    render :layout => 'search'
  end

  def how_it_works
  end
end
