class DashboardController < ApplicationController
  def index
    items = Rails.cache.fetch('items', expires_in: 5.minutes) { PlaylistItems.fetch }

    render :index, locals: { items: items }
  end
end
