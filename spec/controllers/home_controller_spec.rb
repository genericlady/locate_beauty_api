require 'rails_helper'

RSpec.describe HomeController do
  describe "GET index" do
    let(:user) { FactoryGirl.create(:user) }

      it "will return a hash with guest: true" do
        expected_response = {controller: "home", action: "index"}

        get :index
        expect(response.body).to eq(expected_response.to_json)
      end

  end

end
