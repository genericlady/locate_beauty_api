require 'rails_helper'

RSpec.describe User, type: :model do
  it { should respond_to(:auth_token) }

  let(:user) { FactoryGirl.create(:user, auth_token: "cheese") }

  it "generates a unique token after creation" do
    expect(user.auth_token).to eql "cheese"
  end

  it "generates another token when one already has been taken" do
    existing_user = 
      FactoryGirl.create(:user, email: "food@gmail.com", auth_token: "cheese")

    expect(user.auth_token).not_to eql existing_user.auth_token
  end
end
