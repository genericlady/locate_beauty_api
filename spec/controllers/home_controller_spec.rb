require 'rails_helper'

RSpec.describe "HomeController", type: :request do
  describe "GET index" do
    let(:user) { User.create(email: "default@default.com", 
                          password: "cheese",
                          password_confirmation: "cheese") }

    context "When a user is not logged in and visits index action" do
      it "returns json in the body with errors" do
        errors = { errors: ["Not Authenticated"] }.to_json 
        get :index
        expect(response.body).to eq(errors)
      end
    end

    context "When a user is logged in and visits index action" do
      it "will return a hash with guest: true" do
        guest = {logged_in: true}.to_json

        binding.pry
        post "/auth_user", {email: user.email, password: user.password}
        get :index
        expect(response.body).to eq(guest)
      end
    end

  end

end
