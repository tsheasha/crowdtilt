require 'spec_helper'

describe TwitterController do

end

describe TwitterController do
  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response.status).to eq(200)
    end
    it "renders the index template" do
      get :index
      expect(response).to render_template("twitter/index")
    end
  end

  describe "GET common friends" do
    it "Gets the common friends of two Twitter users" do
      get :common_friends, first_user:"yahiaelgamal", second_user:"Trustious"
      expect(response.status).to eq(200)
      expect(response.content_type).to eq("application/json")
    end
  end

  describe "GET recent tweets" do
    it "Gets the most recent Tweets of a Twitter user" do
      get :tweets, username:"yahiaelgamal"
      expect(response.status).to eq(200)
      expect(response.content_type).to eq("application/json")
    end
  end

end
