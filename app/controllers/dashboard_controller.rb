class DashboardController < ApplicationController
  def index
    titles = PlaylistItems.titles

    render :index, locals: { titles: titles }
  end
end
