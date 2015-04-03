require 'rails_helper'

RSpec.describe EpisodesController do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH #update" do
    let(:episode) { create(:episode, :with_video) }

    it "returns valid and gives the video URL" do
      patch :update, { id: episode.id, episode: { watched: true } }
      expect(response).to have_http_status(200)

      body = JSON.parse(response.body)
      expect(body["valid"]).to eq(true)
      expect(body["video_url"]).to match(/\/videos\//)
    end
  end
end
