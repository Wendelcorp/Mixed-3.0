json.extract! mix_song, :id, :artist, :title, :link, :created_at, :updated_at
json.url mix_song_url(mix_song, format: :json)
