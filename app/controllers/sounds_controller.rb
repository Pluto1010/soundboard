class SoundsController < ApplicationController
  before_action :set_sound, only: [:show, :edit, :update, :destroy, :download, :play]

  # GET /sounds
  # GET /sounds.json
  def index
    @sounds = Sound.order(:name).all
  end

  # GET /sounds/1
  # GET /sounds/1.json
  def show
  end

  # GET /sounds/new
  def new
    @sound = Sound.new
  end

  # GET /sounds/1/edit
  def edit
  end

  # POST /sounds
  # POST /sounds.json
  def create
    @sound = Sound.new(sound_params)

    respond_to do |format|
      if @sound.save
        format.html { redirect_to @sound, notice: 'Sound was successfully created.' }
        format.json { render :show, status: :created, location: @sound }
      else
        format.html { render :new }
        format.json { render json: @sound.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sounds/1
  # PATCH/PUT /sounds/1.json
  def update
    respond_to do |format|
      if @sound.update(sound_params)
        format.html { redirect_to @sound, notice: 'Sound was successfully updated.' }
        format.json { render :show, status: :ok, location: @sound }
      else
        format.html { render :edit }
        format.json { render json: @sound.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sounds/1
  # DELETE /sounds/1.json
  def destroy
    @sound.destroy
    respond_to do |format|
      format.html { redirect_to sounds_url, notice: 'Sound was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def download
    redirect_to @sound.soundfile.url(:original, false)
  end

  def play
    Thread.new do
      if os == :macosx
        player_bin = "afplay"
      else
        player_bin = "mplayer -ao alsa"
      end

      play_command = "nohup #{player_bin} #{@sound.soundfile.path}"
      # "#{}&> /dev/null < /dev/null"

      Rails.logger.info play_command
      system play_command
    end

    respond_to do |format|
      format.html { redirect_to sounds_url, notice: "Sound \"#{@sound.name}\" is playing." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sound
      @sound = Sound.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sound_params
      params.require(:sound).permit(:name, :soundfile)
    end
end
