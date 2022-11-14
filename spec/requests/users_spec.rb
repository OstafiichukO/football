require 'rails_helper'
r = Random.new

RSpec.describe "Users", type: :request do
  describe "GET /users without sign in" do
    it "is valid GET users" do
      get 'http://127.0.0.1:3000/users'
      expect(response).to have_http_status(200)
    end
    it "is valid GET users/sign_in" do
      get 'http://127.0.0.1:3000/users/sign_in'
      expect(response).to have_http_status(200)
    end
    it "is valid GET users/sign_up" do
      get 'http://127.0.0.1:3000/users/sign_up'
      expect(response).to have_http_status(200)
    end
    it "is not valid GET users/sign_out" do
      get 'http://127.0.0.1:3000/users/sign_out'
      expect(response).to_not have_http_status(200)
    end
  end

  describe "GET /users with sign in" do
    it "is valid GET users" do
      get 'http://127.0.0.1:3000/users'
      expect(response).to have_http_status(200)
    end
    it "is valid GET users/sign_in" do
      get 'http://127.0.0.1:3000/users/sign_in'
      expect(response).to have_http_status(200)
    end
    it "is valid GET users/sign_up" do
      get 'http://127.0.0.1:3000/users/sign_up'
      expect(response).to have_http_status(200)
    end
    it "is not valid GET users/sign_out" do
      get 'http://127.0.0.1:3000/users/sign_out'
      expect(response).to_not have_http_status(200)
    end
  end
end
