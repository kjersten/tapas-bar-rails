class EpisodesController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json  { render json: { aaData: Episode.all } }
    end
  end
end
