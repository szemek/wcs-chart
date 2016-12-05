class DashboardController < ApplicationController
  def index
    titles = Rails.cache.fetch('titles', expires_in: 5.minutes) { PlaylistItems.titles }

    render :index, locals: { titles: titles }
  end
end
