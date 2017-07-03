class HomeController < ApplicationController

  def index
    render json: {controller: "home", action: "index"}
  end
end
