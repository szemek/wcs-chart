require 'google/apis/youtube_v3'

class PlaylistItems
  def self.fetch
    youtube = Google::Apis::YoutubeV3::YouTubeService.new
    youtube.key = ENV.fetch('YOUTUBE_DEVELOPER_KEY')

    part = 'snippet'
    parameters = {
      playlist_id: 'PL_f1Qvd8LcDohsTUTuvWEtld4oLMh-CQ8',
      max_results: 50
    }

    search = youtube.list_playlist_items(part, parameters)

    items = []

    loop do
      page = search.items.map do |item|
        {
          title: item.snippet.title,
          video_id: item.snippet.resource_id.video_id
        }
      end

      items.concat(page)

      break unless search.next_page_token

      parameters = parameters.merge(page_token: search.next_page_token)
      search = youtube.list_playlist_items(part, parameters)
    end

    items
  end
end
