class SongsController < ApplicationController
  before_action :set_songs
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  # GET mixes/1/songs
  def index
    @songs = @mix.songs
    @song = @mix.songs.build
    @mix = Mix.find(params[:mix_id])
  end

  # GET mixes/1/songs/1
  def show
  end

  # GET mixes/1/songs/new
  def new
    @song = @mix.songs.build
  end

  # GET mixes/1/songs/1/edit
  def edit
  end

  # POST mixes/1/songs
  def create
    @song = @mix.songs.build(song_params)
    @song.link = @song.parse_video_url(@song.link)
    
    if @song.save
      redirect_to([@song.mix, @song], notice: 'Song was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT mixes/1/songs/1
  def update
    if @song.update_attributes(song_params)
      redirect_to([@song.mix, @song], notice: 'Song was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE mixes/1/songs/1
  def destroy
    @song.destroy

    redirect_to mix_songs_url(@mix)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_songs
      @mix = Mix.find(params[:mix_id])
    end

    def set_song
      @song = @mix.songs.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def song_params
      params.require(:song).permit(:artist, :title, :link)
    end
end
