class GuestController < ApplicationController
  def index
    render json: {guest: true}
  end
end
