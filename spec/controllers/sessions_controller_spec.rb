require 'rails_helper'

RSpec.describe SessionsController do
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    let(:correct_name) { "veronica" }
    let(:correct_pw) { "vpass" }

    before do
      ENV["TAPAS_APP_USER"] = correct_name
      ENV["TAPAS_APP_PASS"] = correct_pw
    end

    it "redirects to episodes#index if the username and password are correct" do
      post :create, { session: { username: correct_name, password: correct_pw } }
      expect(response).to redirect_to(episodes_path)
    end

    it "returns an error if username is not correct" do
      post :create, { session: { username: "bad", password: correct_pw } }
      expect(response).to render_template("new")
      expect(flash.now[:danger]).to be_present
    end

    it "returns an error if password is not correct" do
      post :create, { session: { username: correct_name, password: "bad" } }
      expect(response).to render_template("new")
      expect(flash.now[:danger]).to be_present
    end
  end
end
