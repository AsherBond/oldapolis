class PagesController < ApplicationController
  def home
  end

  def about
  end

  def team
  end

  def music
  	gon.users = User.all.map &:artist_name
    render :layout => 'search'
  end

  def how_it_works
  end
end
