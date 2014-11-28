class WelcomeController < ApplicationController
  def index
    render layout: 'user_index'
  end
end
