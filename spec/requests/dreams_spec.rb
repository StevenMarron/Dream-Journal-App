require 'rails_helper'

RSpec.describe "Dreams", type: :request do
  describe "GET /dreams" do
    it "returns a found response" do
      get dreams_url
      expect(response).to have_http_status(302)
      #returns 302 response as dreams are found but because no user is signed in it redirects to login
    end
  end
end
