class EpisodesController < ApplicationController
  def index
    @episodes = Episode.all
  end

  def update
  end
end
