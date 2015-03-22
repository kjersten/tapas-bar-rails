require 'rails_helper'

RSpec.describe EpisodesController do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH #update" do
    it "returns http success" do
      episode = create(:episode)

      patch :update, id: episode.id
      expect(response).to have_http_status(:success)
    end
  end
end
