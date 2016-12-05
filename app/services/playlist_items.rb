require 'google/apis/youtube_v3'

class PlaylistItems
  def self.titles
    youtube = Google::Apis::YoutubeV3::YouTubeService.new
    youtube.key = ENV.fetch('YOUTUBE_DEVELOPER_KEY')

    part = 'snippet'
    parameters = {
      playlist_id: 'PL_f1Qvd8LcDohsTUTuvWEtld4oLMh-CQ8',
      max_results: 50
    }

    search = youtube.list_playlist_items(part, parameters)

    titles = []

    loop do
      titles.concat(search.items.map { |e| e.snippet.title })

      break unless search.next_page_token

      parameters = parameters.merge(page_token: search.next_page_token)
      search = youtube.list_playlist_items(part, parameters)
    end

    titles
  end
end
