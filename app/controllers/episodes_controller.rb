class EpisodesController < ApplicationController

  before_action :require_login

  def index
    @episodes = Episode.all
  end

  def update
    episode = Episode.find(params[:id])
    valid = episode.update(episode_params)
    render json: { valid: valid, video_url: episode.video.url }
  end

  private

  def episode_params
    params.require(:episode).permit(:watched)
  end
end
